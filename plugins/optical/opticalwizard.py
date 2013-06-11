# -*- coding: utf-8 -*-
# vi:si:et:sw=4:sts=4:ts=4

##
## Copyright (C) 2013 Async Open Source <http://www.async.com.br>
## All rights reserved
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., or visit: http://www.gnu.org/.
##
## Author(s): Stoq Team <stoq-devel@async.com.br>
##
""" Wizard for optical pre-sale"""

from decimal import Decimal

import gtk
from kiwi.currency import currency
from kiwi.datatypes import ValidationError
from kiwi.ui.forms import PriceField, NumericField
from kiwi.ui.objectlist import Column
from kiwi.utils import gsignal

from stoqlib.api import api
from stoqlib.domain.sale import Sale
from stoqlib.domain.workorder import WorkOrder, WorkOrderItem
from stoqlib.gui.base.wizards import BaseWizardStep
from stoqlib.gui.dialogs.batchselectiondialog import BatchDecreaseSelectionDialog
from stoqlib.gui.editors.baseeditor import BaseEditor
from stoqlib.gui.widgets.notebookbutton import NotebookCloseButton
from stoqlib.gui.wizards.abstractwizard import SellableItemSlave
from stoqlib.gui.wizards.salequotewizard import (SaleQuoteWizard,
                                                 StartSaleQuoteStep)
from stoqlib.lib.formatters import (format_quantity, format_sellable_description,
                                    get_formatted_percentage)
from stoqlib.lib.translation import stoqlib_gettext

from optical.opticalslave import WorkOrderOpticalSlave
from optical.opticaldomain import OpticalWorkOrder

_ = stoqlib_gettext

# This is the of radio buttons that will fit confortably in the wizard. If the
# sale has more than this number of work orders, then it will be displayed as a
# combo box instead of radio buttons
MAX_WORK_ORDERS_FOR_RADIO = 3


class OpticalStartSaleQuoteStep(StartSaleQuoteStep):
    """First step of the pre-sale for optical stores.

    This is just like the first step of the regular pre-sale, but it has a
    different next step.
    """

    def post_init(self):
        super(StartSaleQuoteStep, self).post_init()
        self.client.mandatory = True
        self.register_validate_function(self.wizard.refresh_next)
        self.force_validation()

    def next_step(self):
        return OpticalWorkOrderStep(self.store, self.wizard, self, self.model)


class OpticalWorkOrderStep(BaseWizardStep):
    """Second step of the pre-sale for optical stores.

    In this step, the sales person will create the workorders required for this
    sale (one for each spectacles)
    """
    gladefile = 'SaleQuoteWorkOrderStep'

    def __init__(self, store, wizard, previous, model):
        self.model = model
        BaseWizardStep.__init__(self, store, wizard, previous)
        self._create_ui()

    #
    #   Private API
    #

    def _create_work_order(self):
        wo = WorkOrder(
            store=self.store,
            sale=self.model,
            equipment=u'',
            branch=api.get_current_branch(self.store),
            client=self.model.client)
        return wo

    def _create_ui(self):
        new_button = gtk.Button(gtk.STOCK_NEW)
        new_button.set_use_stock(True)
        new_button.set_relief(gtk.RELIEF_NONE)
        new_button.show()
        new_button.connect('clicked', self._on_new_work_order__clicked)
        self.work_orders_nb.set_action_widget(new_button, gtk.PACK_END)

        saved_orders = list(WorkOrder.find_by_sale(self.store, self.model))
        # This sale does not have any work order yet. Create the first for it.
        if not saved_orders:
            self._add_workorder(self._create_work_order())
            return

        # This sale already have some workorders, restore them so the user can
        # edit
        for order in saved_orders:
            self._add_workorder(order)

    def _add_workorder(self, workorder):
        self.wizard.workorders.append(workorder)
        total_os = self.work_orders_nb.get_n_pages() + 1
        # Translators: WO is short for Work Order
        label = _('WO %d') % total_os

        button = NotebookCloseButton()
        hbox = gtk.HBox(spacing=6)
        hbox.pack_start(gtk.Label(label))
        hbox.pack_start(button)
        hbox.show_all()

        holder = gtk.EventBox()
        holder.show()
        slave = WorkOrderOpticalSlave(self.store, workorder,
                                      show_finish_date=True)
        self.work_orders_nb.append_page(holder, hbox)
        self.attach_slave(label, slave, holder)

    #
    #   BaseWizardStep hooks
    #

    def post_init(self):
        self.register_validate_function(self.wizard.refresh_next)
        self.force_validation()

    def next_step(self):
        return OpticalItemStep(self.wizard, self, self.store, self.model)

    #
    #   Kiwi callbacks
    #

    def _on_new_work_order__clicked(self, button):
        self._add_workorder(self._create_work_order())


# This is used so we can display on what work order an item is in.
class _TempSaleItem(object):
    def __init__(self, sale_item):
        self._sale_item = sale_item

        self.sellable = sale_item.sellable
        self.base_price = sale_item.base_price
        self.price = sale_item.price
        self.quantity = sale_item.quantity
        self.total = sale_item.get_total()
        self.batch = sale_item.batch

        store = sale_item.store
        self._work_item = WorkOrderItem.get_from_sale_item(store, sale_item)
        optical_wo = store.find(OpticalWorkOrder,
                                work_order=self._work_item.order).one()
        self.patient = optical_wo.patient

    @property
    def description(self):
        return format_sellable_description(self.sellable, self.batch)

    @property
    def sale_discount(self):
        return self._sale_item.get_sale_discount()

    def remove(self):
        # First remove the item from the work order
        work_order = self._work_item.order
        work_order.remove_item(self._work_item)

        # then remove it from the sale
        sale = self._sale_item.sale
        sale.remove_item(self._sale_item)

    def update(self):
        self._work_item.price = self.price
        self._work_item.quantity = self.quantity
        self._sale_item.price = self.price
        self._sale_item.quantity = self.quantity

        self.total = self._sale_item.get_total()


class _ItemEditor(BaseEditor):
    model_name = _(u'Work order item')
    model_type = _TempSaleItem
    confirm_widgets = ['price', 'quantity']

    fields = dict(
        price=PriceField(_(u'Price'), proxy=True, mandatory=True),
        quantity=NumericField(_(u'Quantity'), proxy=True, mandatory=True),
    )

    def on_confirm(self):
        self.model.update()

    def on_price__validate(self, widget, value):
        if value <= 0:
            return ValidationError(_(u"The price must be greater than 0"))

        sellable = self.model.sellable
        if not sellable.is_valid_price(value):
            return ValidationError(_(u"Max discount for this product "
                                     u"is %.2f%%") % sellable.max_discount)

    def on_quantity__validate(self, entry, value):
        sellable = self.model.sellable

        # TODO: Validate quantity properly (checking if the current stock is
        # enougth
        if value <= 0:
            return ValidationError(_(u"The quantity must be greater than 0"))

        if not sellable.is_valid_quantity(value):
            return ValidationError(_(u"This product unit (%s) does not "
                                     u"support fractions.") %
                                   sellable.get_unit_description())


class _ItemSlave(SellableItemSlave):
    """This is the slave that will add the items in the sale and at the same
    time, also add the items to the Work Orders.

    It will emit a the 'get-work-order' signal when the user is adding a new
    item to the sale. The callback should return the |workorder| that the item
    should be added to.
    """
    gsignal('get-work-order', retval=object)

    model_type = Sale
    batch_selection_dialog = BatchDecreaseSelectionDialog
    item_editor = _ItemEditor
    summary_label_text = "<b>%s</b>" % api.escape(_('Total:'))
    value_column = 'price'

    #
    #   SellableItemSlave implementation
    #

    def post_init(self):
        self.hide_add_button()
        self.cost_label.set_label('Price:')
        self.cost.set_editable(True)

    def get_order_item(self, sellable, price, quantity, batch=None):
        work_order = self.emit('get-work-order')
        assert work_order
        sale_item = self.model.add_sellable(sellable, quantity, price, batch=batch)
        order_item = work_order.add_sellable(sellable, quantity=quantity, price=price,
                                             batch=batch)
        order_item.sale_item = sale_item
        return _TempSaleItem(sale_item)

    def get_saved_items(self):
        sale_items = self.model.get_items()
        for item in sale_items:
            yield _TempSaleItem(item)

    def remove_items(self, items):
        for temp_item in items:
            temp_item.remove()

    def get_columns(self, editable=True):
        return [
            Column('sellable.code', title=_(u'Code'),
                   data_type=str, visible=False),
            Column('sellable.barcode', title=_(u'Barcode'),
                   data_type=str, visible=False),
            Column('description', title=_(u'Description'),
                   data_type=str, expand=True),
            Column('patient', title=_(u'Owner'), data_type=str),
            Column('quantity', title=_(u'Quantity'),
                   data_type=Decimal, format_func=format_quantity),
            Column('base_price', title=_('Original Price'), data_type=currency),
            Column('price', title=_('Sale Price'), data_type=currency),
            Column('sale_discount', title=_('Discount'), data_type=Decimal,
                   format_func=get_formatted_percentage),
            Column('total', title=_(u'Total'),
                   data_type=currency),
        ]


class OpticalItemStep(BaseWizardStep):
    """Third step of the optical pre-sale.

    Besides using the <stoqlib.gui.wizards.abstractwizard.SellableItemSlave> to
    add items to the sale, this step has a widget on the top to let the user
    choose on what work order he is adding the items.

    If the sale has more than 4 work orders, then the widget will be a combo
    box.  Otherwise, there will be up to 3 radio buttons for the user to choose
    the work order.
    """
    gladefile = 'OpticalItemStep'

    def __init__(self, wizard, previous, store, model):
        self.model = model
        BaseWizardStep.__init__(self, store, wizard, previous)
        self._radio_group = None
        self._create_ui()

    def _create_ui(self):
        self._setup_workorders_widget()
        slave = _ItemSlave(self.store, self.model)
        slave.connect('get-work-order', self._on_item_slave__get_work_order)
        self.attach_slave('slave_holder', slave)

    def _add_radio(self, desc, workorder):
        widget = gtk.RadioButton(self._radio_group, desc)
        widget.set_data('workorder', workorder)
        widget.connect('toggled', self._on_radio__toggled)
        if self._radio_group is None:
            self._radio_group = widget
            self._selected_workorder = workorder
        self.work_orders_box.pack_start(widget, False, False, 6)
        widget.show()

    def _setup_workorders_widget(self):
        data = []
        for wo in self.wizard.workorders:
            optical_wo = self.store.find(OpticalWorkOrder, work_order=wo).one()
            desc = _('Work order for %s') % optical_wo.patient
            wo.equipment = desc
            wo.estimated_start = wo.estimated_finish

            # The work order might be already approved, if we are editing a
            # sale.
            if wo.can_approve():
                wo.approve()
            data.append([desc, wo])

        if len(data) <= MAX_WORK_ORDERS_FOR_RADIO:
            self.work_orders_combo.hide()
            for desc, wo in data:
                self._add_radio(desc, wo)
        else:
            self.work_orders_box.hide()
            self.work_orders_combo.prefill(data)

    #
    #   Public API
    #

    def get_work_order(self):
        """Returns what |workorder| the user has selected.
        """
        if self.work_orders_combo.get_visible():
            return self.work_orders_combo.read()
        else:
            return self._selected_workorder

    #
    #   Wizard Step Implementation
    #

    def has_next_step(self):
        return False

    #
    #   Callbacks
    #

    def _on_item_slave__get_work_order(self, widget):
        return self.get_work_order()

    def _on_radio__toggled(self, radio):
        if not radio.get_active():
            return
        self._selected_workorder = radio.get_data('workorder')


class OpticalSaleQuoteWizard(SaleQuoteWizard):
    """Wizard for optical pre-sales.

    This is similar to the regular pre-sale, but has an additional step to
    create some workorders, and the item step is changed a little bit, to allow
    the sales person to select in what work order the item should be added to.
    """
    def __init__(self, *args, **kwargs):
        self.workorders = []
        SaleQuoteWizard.__init__(self, *args, **kwargs)

    def get_first_step(self, store, model):
        return OpticalStartSaleQuoteStep(store, self, model)

    def finish(self):
        # Now we must remove the products added to the workorders from the stock
        for wo in self.workorders:
            wo.sync_stock()

        # And also set them as already decreased in the sale, so it does not get
        # decreased twice
        for item in self.model.get_items():
            item.quantity_decreased = item.quantity

        SaleQuoteWizard.finish(self)
