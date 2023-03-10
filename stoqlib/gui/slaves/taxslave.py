# -*- coding: utf-8 -*-
# vi:si:et:sw=4:sts=4:ts=4

##
## Copyright (C) 2010 Async Open Source <http://www.async.com.br>
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
""" Slaves for books """

import datetime
from dateutil.relativedelta import relativedelta

from gi.repository import Gtk

from kiwi.datatypes import ValidationError
from kiwi.ui.widgets.combo import ProxyComboBox
from kiwi.ui.widgets.spinbutton import ProxySpinButton

from stoqlib.api import api
from stoqlib.domain.taxes import (InvoiceItemCofins, InvoiceItemIcms,
                                  InvoiceItemIpi, InvoiceItemPis,
                                  ProductCofinsTemplate,
                                  ProductIcmsTemplate, ProductIpiTemplate,
                                  ProductPisTemplate, ProductTaxTemplate)
from stoqlib.lib.dateutils import localtoday
from stoqlib.lib.translation import stoqlib_gettext
from stoqlib.gui.editors.baseeditor import BaseEditorSlave


_ = stoqlib_gettext


class BaseTaxSlave(BaseEditorSlave):
    combo_widgets = ()
    percentage_widgets = ()
    value_widgets = ()

    hide_widgets = ()

    tooltips = {}

    field_options = {}

    def __init__(self, store, *args, **kargs):
        self.is_updating = False
        self.proxy = None
        BaseEditorSlave.__init__(self, store, *args, **kargs)

    def _setup_widgets(self):
        for name, options in self.field_options.items():
            widget = getattr(self, name)
            # set_size_request is not working, so as a workaround, lets truncate
            # the length of the options...
            new_options = []
            for (key, value) in options:
                if isinstance(key, str) and len(key) > 70:
                    new_options.append((key[:70] + '...', value))
                else:
                    new_options.append((key, value))
            widget.prefill(new_options)
            widget.set_size_request(220, -1)

        for name in self.percentage_widgets:
            widget = getattr(self, name)
            widget.set_digits(2)
            widget.set_adjustment(
                Gtk.Adjustment(lower=0, upper=100, step_increment=1))

        for w in self.hide_widgets:
            getattr(self, w).hide()
            getattr(self, w + '_label').hide()

        for name, tooltip in self.tooltips.items():
            widget = getattr(self, name)
            if isinstance(widget, Gtk.Entry):
                widget.set_property('primary-icon-stock', Gtk.STOCK_INFO)
                widget.set_property('primary-icon-tooltip-text', tooltip)
                widget.set_property('primary-icon-sensitive', True)
                widget.set_property('primary-icon-activatable', False)

        self.setup_callbacks()

    def setup_callbacks(self):
        """Implement this in a child when necessary
        """
        pass

    def set_valid_widgets(self, valid_widgets):
        if self.visual_mode:
            return
        for widget in self.all_widgets:
            if widget in valid_widgets:
                getattr(self, widget).set_sensitive(True)
                lbl = getattr(self, widget + '_label', None)
                if lbl:
                    lbl.set_sensitive(True)
            else:
                getattr(self, widget).set_sensitive(False)
                lbl = getattr(self, widget + '_label', None)
                if lbl:
                    lbl.set_sensitive(True)

    def unset_values(self, valid_widgets):
        """Unset the values of all the unnecessary widgets

        :param valid_widgets: a list of valid widget name
        """
        for widget_name in self.proxy_widgets:
            if widget_name in valid_widgets:
                # Do not unset valid widgets
                continue

            widget = getattr(self, widget_name)
            if isinstance(widget, ProxySpinButton):
                # Updating all invalid ProxySpinButtons.
                widget.update(0)
                if widget == self.p_cred_sn:
                    # Only unset the expiration date if the aliquot is
                    # is also unset.
                    self.p_cred_sn_valid_until.update(None)

            if isinstance(widget, ProxyComboBox):
                widget.select_item_by_position(0)


class InvoiceItemMixin(object):

    def fill_combo(self, combo, type):
        types = [(None, None)]
        types.extend([(t.name, t.get_tax_model()) for t in
                      self.store.find(ProductTaxTemplate, tax_type=type)])
        combo.prefill(types)

    def on_template__changed(self, widget):
        template = widget.read()
        if not template:
            return

        self.model.set_item_tax(self.invoice_item, template)
        self.update_values(self.proxy_widgets)


#
#   ICMS
#


class BaseICMSSlave(BaseTaxSlave):
    gladefile = 'TaxICMSSlave'

    combo_widgets = ['cst', 'csosn', 'orig', 'mod_bc', 'mod_bc_st', 'mot_des_icms']
    percentage_widgets = ['p_icms', 'p_mva_st', 'p_red_bc_st', 'p_icms_st',
                          'p_red_bc', 'p_cred_sn', 'p_fcp', 'p_fcp_st']
    value_widgets = ['v_bc', 'v_icms', 'v_bc_st', 'v_icms_st',
                     'v_cred_icms_sn', 'v_bc_st_ret', 'v_icms_st_ret', 'v_fcp',
                     'v_fcp_st', 'v_fcp_st_ret']
    bool_widgets = ['bc_include_ipi', 'bc_st_include_ipi']
    date_widgets = ['p_cred_sn_valid_until']
    all_widgets = (combo_widgets + percentage_widgets + value_widgets +
                   bool_widgets + date_widgets)

    simples_widgets = ['orig', 'csosn', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
                       'p_icms_st', 'v_bc_st', 'v_icms_st', 'p_cred_sn',
                       'p_cred_sn_valid_until' 'v_cred_icms_sn', 'v_bc_st_ret',
                       'v_icms_st_ret', 'v_fcp_st_ret'],

    normal_widgets = ['orig', 'cst', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
                      'p_icms_st', 'p_fcp', 'p_fcp_st', 'v_fcp', 'v_fcp_st',
                      'v_bc_st', 'v_icms_st', 'bc_st_include_ipi',
                      'mod_bc', 'p_icms', 'v_bc', 'v_icms', 'p_red_bc',
                      'bc_include_ipi', 'bc_st_include_ipi', 'mot_des_icms']

    tooltips = {
        'p_icms': u'Aliquota do imposto',
        'p_mva_st': u'Percentual da margem de valor adicionado do ICMS ST',
        'p_red_bc_st': u'Percentual da Redu????o de Base de C??lculo do ICMS ST'
    }

    field_options = {
        'cst': (
            (None, None),
            (u'00 - Tributada Integralmente', 0),
            (u'10 - Tributada e com cobran??a de ICMS por subst. trib.', 10),
            (u'20 - Com redu????o de BC', 20),
            (u'30 - Isenta ou n??o trib. e com cobran??a de ICMS por subst. trib.', 30),
            (u'40 - Isenta', 40),
            (u'41 - N??o tributada', 41),
            (u'50 - Suspens??o', 50),
            (u'51 - Deferimento', 51),
            (u'60 - ICMS cobrado anteriormente por subst. trib.', 60),
            (u'70 - Com redu????o da BC cobran??a do ICMS por subst. trib.', 70),
            (u'90 - Outros', 90),
        ),

        'csosn': (
            (None, None),
            (u'101 - Tributada com permiss??o de cr??dito', 101),
            (u'102 - Tributada sem permiss??o de cr??dito', 102),
            (u'103 - Isen????o do ICMS para faixa de receita bruta', 103),
            (u'201 - Tributada com permiss??o de cr??dito e com cobran??a do ICMS por ST', 201),
            (u'202 - Tributada sem permiss??o de cr??dito e com cobran??a do ICMS por ST', 202),
            (u'203 - Isen????o do ICMS para faixa de receita bruta e com cobran??a do ICMS por ST',
             203),
            (u'300 - Imune', 300),
            (u'400 - N??o tributada', 400),
            (u'500 - ICMS cobrado anteriormente por ST ou por antecipa????o', 500),
            (u'900 - Outros', 900),
        ),

        # http://www.fazenda.gov.br/confaz/confaz/ajustes/2012/AJ_020_12.htm
        # http://www.fazenda.gov.br/confaz/confaz/ajustes/2013/AJ_015_13.htm
        # http://www.fazenda.gov.br/confaz/confaz/Convenios/ICMS/2013/CV038_13.htm
        'orig': (
            (None, None),
            (u'0 - Nacional, '
             u'exceto as indicadas nos c??digos 3, 4, 5 e 8', 0),
            (u'1 - Estrangeira - Importa????o direta, '
             u'exceto a indicada no c??digo 6', 1),
            (u'2 - Estrangeira - Adquirida no mercado interno, '
             u'exceto a indicada no c??digo 7', 2),
            (u'3 - Nacional, mercadoria ou bem com Conte??do de '
             u'Importa????o superior a 40% e inferior ou igual a 70%', 3),
            (u'4 - Nacional, cuja produ????o tenha sido feita em '
             u'conformidade com os processos produtivos b??sicos', 4),
            (u'5 - Nacional, mercadoria ou bem com Conte??do de '
             u'Importa????o inferior ou igual a 40%', 5),
            (u'6 - Estrangeira - Importa????o direta, '
             u'sem similar nacional, constante na CAMEX', 6),
            (u'7 - Estrangeira - Adquirida no mercado interno, '
             u'sem similar nacional, constante na CAMEX', 7),
            (u'8 - Nacional, mercadoria ou bem com Conte??do de Importa????o '
             u'superior a 70%', 8),
        ),
        'mod_bc': (
            (None, None),
            (u'0 - Margem do valor agregado (%)', 0),
            (u'1 - Pauta (Valor)', 1),
            (u'2 - Pre??o tabelado m??ximo (valor)', 2),
            (u'3 - Valor da opera????o', 3),
        ),
        'mod_bc_st': (
            (None, None),
            (u'0 - Pre??o tabelado ou m??ximo sugerido', 0),
            (u'1 - Lista negativa (valor)', 1),
            (u'2 - Lista positiva (valor)', 2),
            (u'3 - Lista neutra (valor)', 3),
            (u'4 - Margem Valor Agregado (%)', 4),
            (u'5 - Pauta (valor)', 5),
        ),
        'mot_des_icms': (
            (None, None),
            ('3 - Uso na agropecu??ria', ProductIcmsTemplate.REASON_LIVESTOCK),
            ('9 - Outros', ProductIcmsTemplate.REASON_OTHERS),
            ('12 - ??rg??o de fomento de desenvolvimento agropecu??rio',
             ProductIcmsTemplate.REASON_AGRICULTURAL_AGENCY)
        )
    }

    MAP_VALID_WIDGETS = {
        0: ['orig', 'cst', 'mod_bc', 'p_icms', 'v_bc', 'v_icms',
            'bc_include_ipi', 'p_fcp', 'v_fcp'],
        10: ['orig', 'cst', 'mod_bc', 'p_icms', 'mod_bc_st', 'p_mva_st',
             'p_red_bc_st', 'p_icms_st', 'v_bc', 'v_icms', 'v_bc_st',
             'v_icms_st', 'bc_include_ipi', 'bc_st_include_ipi', 'p_fcp',
             'p_fcp_st', 'v_fcp', 'v_fcp_st'],
        20: ['orig', 'cst', 'mod_bc', 'p_icms', 'p_red_bc', 'v_bc',
             'v_icms', 'bc_include_ipi', 'p_fcp', 'v_fcp', 'mot_des_icms'],
        30: ['orig', 'cst', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
             'p_icms_st', 'v_bc_st', 'v_icms_st', 'bc_st_include_ipi',
             'p_fcp_st', 'v_fcp_st', 'mot_des_icms'],
        40: ['orig', 'cst', 'mot_des_icms'],
        41: ['orig', 'cst', 'mot_des_icms'],  # Same tag
        50: ['orig', 'cst', 'mot_des_icms'],
        51: ['orig', 'cst', 'mod_bc', 'p_red_bc', 'p_icms', 'v_bc',
             'v_icms', 'bc_st_include_ipi', 'p_fcp', 'v_fcp'],
        60: ['orig', 'cst', 'v_bc_st', 'v_icms_st', 'v_fcp_st'],
        70: normal_widgets,
        90: normal_widgets,
        # Simples Nacional
        101: ['orig', 'csosn', 'p_cred_sn', 'p_cred_sn_valid_until',
              'v_cred_icms_sn'],
        102: ['orig', 'csosn'],
        103: ['orig', 'csosn'],
        201: ['orig', 'csosn', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
              'p_icms_st', 'v_bc_st', 'v_icms_st', 'p_cred_sn', 'p_fcp_st',
              'v_fcp_st', 'p_cred_sn_valid_until', 'v_cred_icms_sn'],
        202: ['orig', 'csosn', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
              'p_icms_st', 'v_bc_st', 'v_icms_st', 'p_fcp_st', 'v_fcp_st'],
        203: ['orig', 'csosn', 'mod_bc_st', 'p_mva_st', 'p_red_bc_st',
              'p_icms_st', 'v_bc_st', 'v_icms_st', 'p_fcp_st', 'v_fcp_st'],
        300: ['orig', 'csosn'],
        400: ['orig', 'csosn'],
        500: ['orig', 'csosn', 'v_bc_st_ret', 'v_icms_st_ret', 'v_fcp_st_ret'],
        900: ['orig', 'csosn', 'mod_bc', 'v_bc', 'p_red_bc', 'p_icms', 'v_icms',
              'mod_bc_st', 'p_mva_st', 'p_red_bc_st', 'v_bc_st', 'p_icms_st',
              'v_icms_st', 'p_cred_sn', 'v_cred_icms_sn', 'p_fcp_st', 'v_fcp_st']
    }

    def setup_proxies(self):
        self._setup_widgets()
        self.branch = api.get_current_branch(self.model.store)
        self.proxy = self.add_proxy(self.model, self.proxy_widgets)

        # Simple Nacional
        if self.branch.crt in [1, 2]:
            self._update_selected_csosn()
        else:
            self._update_selected_cst()

    #
    # Private API
    #

    def _update_widgets(self):
        has_p_cred_sn = (self.p_cred_sn.get_sensitive()
                         and bool(self.p_cred_sn.get_value()))
        self.p_cred_sn_valid_until.set_sensitive(has_p_cred_sn)

    def _update_p_cred_sn_valid_until(self):
        if (self.p_cred_sn.get_value()
                and not self.p_cred_sn_valid_until.get_date()):
            # Set the default expire date to the last day of current month.
            default_expire_date = (localtoday().date() +
                                   relativedelta(day=1, months=+1, days=-1))
            self.p_cred_sn_valid_until.set_date(default_expire_date)

    def _update_selected_cst(self):
        cst = self.cst.get_selected_data()
        valid_widgets = self.MAP_VALID_WIDGETS.get(cst, ('cst', ))
        self.unset_values(valid_widgets)
        self.set_valid_widgets(valid_widgets)

    def _update_selected_csosn(self):
        csosn = self.csosn.get_selected_data()
        valid_widgets = self.MAP_VALID_WIDGETS.get(csosn, ('csosn', ))
        self.unset_values(valid_widgets)
        self.set_valid_widgets(valid_widgets)

    #
    # Kiwi Callbacks
    #

    def on_cst__changed(self, widget):
        if not self.proxy:
            return

        self._update_selected_cst()

    def on_csosn__changed(self, widget):
        if not self.proxy:
            return

        self._update_selected_csosn()
        self._update_widgets()

    def after_p_cred_sn__changed(self, widget):
        self._update_p_cred_sn_valid_until()
        self.p_cred_sn_valid_until.validate(force=True)
        self._update_widgets()

    def on_p_cred_sn_valid_until__validate(self, widget, value):
        if not self.p_cred_sn.get_value():
            return
        if value <= datetime.date.today():
            return ValidationError(_(u"This date must be set in the future."))


class ICMSTemplateSlave(BaseICMSSlave):
    model_type = ProductIcmsTemplate
    proxy_widgets = (BaseICMSSlave.combo_widgets +
                     BaseICMSSlave.percentage_widgets +
                     BaseICMSSlave.bool_widgets +
                     BaseICMSSlave.date_widgets)
    hide_widgets = BaseICMSSlave.value_widgets + ['template']


class InvoiceItemIcmsSlave(BaseICMSSlave, InvoiceItemMixin):
    model_type = InvoiceItemIcms
    proxy_widgets = (BaseICMSSlave.combo_widgets +
                     BaseICMSSlave.percentage_widgets +
                     BaseICMSSlave.bool_widgets +
                     BaseICMSSlave.value_widgets)
    hide_widgets = BaseICMSSlave.date_widgets

    def __init__(self, store, model, invoice_item):
        self.invoice_item = invoice_item
        BaseICMSSlave.__init__(self, store, model)

    def setup_callbacks(self):
        self.fill_combo(self.template, ProductTaxTemplate.TYPE_ICMS)

        for name in self.percentage_widgets:
            widget = getattr(self, name)
            widget.connect_after('changed', self._after_field__changed)

        self.bc_include_ipi.connect_after('toggled', self._after_field__changed)
        self.bc_st_include_ipi.connect_after('toggled',
                                             self._after_field__changed)
        self.cst.connect_after('changed', self._after_field__changed)
        self.csosn.connect_after('changed', self._after_field__changed)

    def update_values(self, widgets=None):
        self.is_updating = True
        self.model.update_values(self.invoice_item)
        widgets = widgets or self.value_widgets
        for name in widgets:
            if name in ('csosn', 'cst'):
                continue
            self.proxy.update(name)

        # We need to update cst and csosn last: Since when one of those is
        # changed we change some widgets sensitivity, when changing the widget
        # sensitivity, kiwi will reset the model value incorrectly.
        self.proxy.update_many(['csosn', 'cst'])
        self.is_updating = False

    #
    # Kiwi Callbacks
    #

    def _after_field__changed(self, widget):
        if not self.proxy or self.is_updating:
            return

        self.update_values()

#
# IPI
#


class BaseIPISlave(BaseTaxSlave):
    gladefile = 'TaxIPISlave'

    combo_widgets = ['cst', 'calculo']
    percentage_widgets = ['p_ipi']
    text_widgets = ['cl_enq', 'cnpj_prod', 'c_selo', 'c_enq']
    value_widgets = ['v_ipi', 'v_bc', 'v_unid', 'q_selo', 'q_unid']
    all_widgets = (combo_widgets + percentage_widgets + value_widgets +
                   text_widgets)

    tooltips = {
        'cl_enq': u'Preenchimento conforme Atos Normativos editados pela '
                  u'Receita Federal (Observa????o 4)',
        'cnpj_prod': u'Informar os zeros n??o significativos',
        'c_selo': u'Preenchimento conforme Atos Normativos editados pela '
                  u'Receita Federal (Observa????o 3)',
        'c_enq': u'Tabela a ser criada pela RFB, informar 999 enquanto a '
                 u'tabela n??o for criada',
    }

    field_options = {
        'cst': (
            (None, None),
            (u'00 - Entrada com recupera????o de cr??dito', 0),
            (u'01 - Entrada tributada com al??quota zero', 1),
            (u'02 - Entrada isenta', 2),
            (u'03 - Entrada n??o-tributada', 3),
            (u'04 - Entrada imune', 4),
            (u'05 - Entrada com suspens??o', 5),
            (u'49 - Outras entradas', 49),
            (u'50 - Sa??da tributada', 50),
            (u'51 - Sa??da tributada com al??quota zero', 51),
            (u'52 - Sa??da isenta', 52),
            (u'53 - Sa??da n??o-tributada', 53),
            (u'54 - Sa??da imune', 54),
            (u'55 - Sa??da com suspens??o', 55),
            (u'99 - Outras sa??das', 99),
        ),
        'calculo': (
            (u'Por al??quota', u'aliquot'),
            (u'Valor por unidade', u'unit'),
        )
    }

    # This widgets should be enabled when this option is selected.
    MAP_VALID_WIDGETS = {
        0: all_widgets,
        1: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        2: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        3: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        4: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        5: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        49: all_widgets,
        50: all_widgets,
        51: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        52: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        53: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        54: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        55: ['cst', 'cl_enq', 'cnpj_prod', 'c_selo', 'q_selo', 'c_enq'],
        99: all_widgets,
    }

    #
    # Public API
    #

    def setup_proxies(self):
        self._setup_widgets()
        self.proxy = self.add_proxy(self.model, self.proxy_widgets)
        self._update_selected_cst()
        self._update_selected_calculo()

    #
    # Private API
    #

    def _update_selected_cst(self):
        cst = self.cst.get_selected_data()
        valid_widgets = self.MAP_VALID_WIDGETS.get(cst, ('cst', ))
        self.set_valid_widgets(valid_widgets)

    def _update_selected_calculo(self):
        # IPI is only calculated if cst is one of the following
        if not self.model.cst in (0, 49, 50, 99):
            return

        calculo = self.calculo.get_selected_data()

        if calculo == InvoiceItemIpi.CALC_ALIQUOTA:
            self.p_ipi.set_sensitive(True)
            self.v_bc.set_sensitive(True)
            self.v_unid.set_sensitive(False)
            self.q_unid.set_sensitive(False)
        elif calculo == InvoiceItemIpi.CALC_UNIDADE:
            self.p_ipi.set_sensitive(False)
            self.v_bc.set_sensitive(False)
            self.v_unid.set_sensitive(True)
            self.q_unid.set_sensitive(True)

    #
    # Kiwi callbacks
    #

    def on_cst__changed(self, widget):
        self._update_selected_cst()

    def on_calculo__changed(self, widget):
        self._update_selected_calculo()


class IPITemplateSlave(BaseIPISlave):
    model_type = ProductIpiTemplate
    proxy_widgets = (BaseIPISlave.combo_widgets +
                     BaseIPISlave.percentage_widgets +
                     BaseIPISlave.text_widgets)
    hide_widgets = BaseIPISlave.value_widgets + ['template']


class InvoiceItemIpiSlave(BaseIPISlave, InvoiceItemMixin):
    model_type = InvoiceItemIpi
    proxy_widgets = BaseIPISlave.all_widgets

    def __init__(self, store, model, invoice_item):
        self.invoice_item = invoice_item
        BaseIPISlave.__init__(self, store, model)

    #
    # Public API
    #

    def setup_callbacks(self):
        self.fill_combo(self.template, ProductTaxTemplate.TYPE_IPI)
        self.p_ipi.connect_after('changed', self._after_field__changed)
        self.q_unid.connect_after('changed', self._after_field__changed)
        self.cst.connect_after('changed', self._after_field__changed)

    def update_values(self, widgets=None):
        self.model.update_values(self.invoice_item)
        widgets = widgets or ['v_bc', 'v_ipi']
        for name in widgets:
            if name == 'cst':
                continue
            self.proxy.update(name)

        # We need to update cst and csosn last: Since when one of those is
        # changed we change some widgets sensitivity, when changing the widget
        # sensitivity, kiwi will reset the model value incorrectly.
        self.proxy.update('cst')

    #
    # Kiwi Callbacks
    #

    def _after_field__changed(self, widget):
        if not self.proxy or self.is_updating:
            return

        self.update_values()

#
# PIS
#


class BasePISSlave(BaseTaxSlave):
    gladefile = 'TaxPISSlave'

    combo_widgets = ['cst', 'calculo']
    percentage_widgets = ['p_pis']
    value_widgets = ['v_pis']
    all_widgets = (combo_widgets + percentage_widgets + value_widgets)

    field_options = {
        'cst': (
            (None, 0),
            (u'01 - Tribut??vel com Al??quota B??sica', 1),
            (u'02 - Tribut??vel com Al??quota Difenrenciada', 2),
            (u'04 - Tribut??vel Monof??sica - Revenda a Al??quota Zero', 4),
            (u'05 - Tribut??vel por Substitui????o Tribut??ria', 5),
            (u'06 - Tribut??vel a Al??quota Zero', 6),
            (u'07 - Isenta da Contribui????o', 7),
            (u'08 - Sem Incid??ncia da Contribui????o', 8),
            (u'09 - Com Suspens??o da Contribui????o', 9),
            (u'49 - Outras Opera????es de Sa??da', 49),
            (u'50 - Com Direito a Cr??dito - Vinculada Exclusivamente a Receita'
             u'Tributada no Mercado Interno', 50),
            (u'51 - Opera????o com Direito a Cr??dito - Vinculada Exclusivamente a'
             u'Receita N??o Tributada no Mercado Interno', 51),
            (u'52 - Opera????o com Direito a Cr??dito - Vinculada Exclusivamente a'
             u'Receita de Exporta????o', 52),
            (u'53 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas e N??o-Tributadas no Mercado Interno', 53),
            (u'54 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas no Mercado Interno e de Exporta????o', 54),
            (u'55 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'N??o-Tributadas no Mercado Interno e de Exporta????o', 55),
            (u'56 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas e N??o-Tributadas no Mercado Interno, e de Exporta????o', 56),
            (u'60 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita Tributada no Mercado Interno', 60),
            (u'61 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita N??o-Tributada no Mercado Interno', 61),
            (u'62 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita de Exporta????o', 62),
            (u'63 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas e N??o-Tributadas no Mercado Interno', 63),
            (u'64 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas no Mercado Interno e de Exporta????o', 64),
            (u'65 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas N??o-Tributadas no Mercado Interno e de Exporta????o', 65),
            (u'66 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas e N??o-Tributadas no Mercado Interno, e de'
             u'Exporta????o', 66),
            (u'67 - Cr??dito Presumido - Outras Opera????es', 67),
            (u'70 - Opera????o de Aquisi????o sem Direito a Cr??dito', 70),
            (u'71 - Opera????o de Aquisi????o com Isen????o', 71),
            (u'72 - Opera????o de Aquisi????o com Suspens??o', 72),
            (u'73 - Opera????o de Aquisi????o a Al??quota Zero', 73),
            (u'74 - Opera????o de Aquisi????o sem Incid??ncia da Contribui????o', 74),
            (u'75 - Opera????o de Aquisi????o por Substitui????o Tribut??ria', 75),
            (u'98 - Outras Opera????es de Entrada', 98),
            (u'99 - Outras Opera????es', 99),
        ),
        'calculo': (
            (u'Percentual', 'percentage'),
        )
    }

    # This widgets should be enabled when this option is selected.
    MAP_VALID_WIDGETS = {
        0: ['cst'],
        1: ['cst', 'p_pis'],
        2: ['cst', 'p_pis'],
        4: ['cst'],
        5: ['cst'],
        6: ['cst'],
        7: ['cst'],
        8: ['cst'],
        9: ['cst'],
        49: ['cst', 'calculo', 'p_pis'],
        50: ['cst', 'calculo', 'p_pis'],
        51: ['cst', 'calculo', 'p_pis'],
        52: ['cst', 'calculo', 'p_pis'],
        53: ['cst', 'calculo', 'p_pis'],
        54: ['cst', 'calculo', 'p_pis'],
        55: ['cst', 'calculo', 'p_pis'],
        56: ['cst', 'calculo', 'p_pis'],
        60: ['cst', 'calculo', 'p_pis'],
        61: ['cst', 'calculo', 'p_pis'],
        62: ['cst', 'calculo', 'p_pis'],
        63: ['cst', 'calculo', 'p_pis'],
        64: ['cst', 'calculo', 'p_pis'],
        65: ['cst', 'calculo', 'p_pis'],
        66: ['cst', 'calculo', 'p_pis'],
        67: ['cst', 'calculo', 'p_pis'],
        70: ['cst', 'calculo', 'p_pis'],
        71: ['cst', 'calculo', 'p_pis'],
        72: ['cst', 'calculo', 'p_pis'],
        73: ['cst', 'calculo', 'p_pis'],
        74: ['cst', 'calculo', 'p_pis'],
        75: ['cst', 'calculo', 'p_pis'],
        98: ['cst', 'calculo', 'p_pis'],
        99: ['cst', 'calculo', 'p_pis'],
    }

    #
    # Public API
    #

    def setup_proxies(self):
        self._setup_widgets()
        self.proxy = self.add_proxy(self.model, self.proxy_widgets)
        self._update_selected_cst()

    #
    # Private API
    #

    def _update_selected_cst(self):
        cst = self.cst.get_selected_data()
        valid_widgets = self.MAP_VALID_WIDGETS.get(cst, ('cst', ))
        self.set_valid_widgets(valid_widgets)

    def _update_selected_calculo(self):
        # When the CST is contained in the list the calculation is not performed
        # because the taxpayer is exempt.
        if self.model.cst in [0, 4, 5, 6, 7, 8, 9]:
            return

        calculo = self.calculo.get_selected_data()
        if calculo == ProductPisTemplate.CALC_PERCENTAGE:
            self.p_pis.set_sensitive(True)

    #
    # Kiwi callbacks
    #

    def on_cst__changed(self, widget):
        self._update_selected_cst()

    def on_calculo__changed(self, widget):
        self._update_selected_calculo()

    def on_p_pis__validate(self, widget, value):
        if not 0 <= value <= 100:
            return ValidationError(_('The PIS aliquot must be between 0 and 100'))


class PISTemplateSlave(BasePISSlave):
    model_type = ProductPisTemplate
    proxy_widgets = (BasePISSlave.combo_widgets +
                     BasePISSlave.percentage_widgets)
    hide_widgets = BasePISSlave.value_widgets + ['template']


class InvoiceItemPisSlave(BasePISSlave, InvoiceItemMixin):
    model_type = InvoiceItemPis
    proxy_widgets = BasePISSlave.all_widgets

    def __init__(self, store, model, invoice_item):
        self.invoice_item = invoice_item
        BasePISSlave.__init__(self, store, model)

    def create_model(self, store):
        model = InvoiceItemPis(store=store)
        self.invoice_item.pis_info = model
        return model

    #
    # Public API
    #

    def setup_callbacks(self):
        self.fill_combo(self.template, ProductTaxTemplate.TYPE_PIS)
        self.p_pis.connect_after('changed', self._after_field__changed)
        self.cst.connect_after('changed', self._after_field__changed)

    def update_values(self, widgets=None):
        self.model.update_values(self.invoice_item)
        widgets = widgets or ['v_pis']
        for name in widgets:
            if name == 'cst':
                continue
            self.proxy.update(name)

        # We need to update cst last: Since when one of those is
        # changed we change some widgets sensitivity, when changing the widget
        # sensitivity, kiwi will reset the model value incorrectly.
        self.proxy.update('cst')

    #
    # Kiwi Callbacks
    #

    def _after_field__changed(self, widget):
        if not self.proxy or self.is_updating:
            return

        self.update_values()

#
# COFINS
#


class BaseCOFINSSlave(BaseTaxSlave):
    gladefile = 'TaxCOFINSSlave'

    combo_widgets = ['cst', 'calculo']
    percentage_widgets = ['p_cofins']
    value_widgets = ['v_cofins']
    all_widgets = (combo_widgets + percentage_widgets + value_widgets)

    field_options = {
        'cst': (
            (None, 0),
            (u'01 - Tribut??vel com Al??quota B??sica', 1),
            (u'02 - Tribut??vel com Al??quota Difenrenciada', 2),
            (u'04 - Tribut??vel Monof??sica - Revenda a Al??quota Zero', 4),
            (u'05 - Tribut??vel por Substitui????o Tribut??ria', 5),
            (u'06 - Tribut??vel a Al??quota Zero', 6),
            (u'07 - Isenta da Contribui????o', 7),
            (u'08 - Sem Incid??ncia da Contribui????o', 8),
            (u'09 - Com Suspens??o da Contribui????o', 9),
            (u'49 - Outras Opera????es de Sa??da', 49),
            (u'50 - Com Direito a Cr??dito - Vinculada Exclusivamente a Receita'
             u'Tributada no Mercado Interno', 50),
            (u'51 - Opera????o com Direito a Cr??dito - Vinculada Exclusivamente a'
             u'Receita N??o Tributada no Mercado Interno', 51),
            (u'52 - Opera????o com Direito a Cr??dito - Vinculada Exclusivamente a'
             u'Receita de Exporta????o', 52),
            (u'53 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas e N??o-Tributadas no Mercado Interno', 53),
            (u'54 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas no Mercado Interno e de Exporta????o', 54),
            (u'55 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'N??o-Tributadas no Mercado Interno e de Exporta????o', 55),
            (u'56 - Opera????o com Direito a Cr??dito - Vinculada a Receitas'
             u'Tributadas e N??o-Tributadas no Mercado Interno, e de Exporta????o', 56),
            (u'60 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita Tributada no Mercado Interno', 60),
            (u'61 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita N??o-Tributada no Mercado Interno', 61),
            (u'62 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada'
             u'Exclusivamente a Receita de Exporta????o', 62),
            (u'63 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas e N??o-Tributadas no Mercado Interno', 63),
            (u'64 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas no Mercado Interno e de Exporta????o', 64),
            (u'65 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas N??o-Tributadas no Mercado Interno e de Exporta????o', 65),
            (u'66 - Cr??dito Presumido - Opera????o de Aquisi????o Vinculada a'
             u'Receitas Tributadas e N??o-Tributadas no Mercado Interno, e de'
             u'Exporta????o', 66),
            (u'67 - Cr??dito Presumido - Outras Opera????es', 67),
            (u'70 - Opera????o de Aquisi????o sem Direito a Cr??dito', 70),
            (u'71 - Opera????o de Aquisi????o com Isen????o', 71),
            (u'72 - Opera????o de Aquisi????o com Suspens??o', 72),
            (u'73 - Opera????o de Aquisi????o a Al??quota Zero', 73),
            (u'74 - Opera????o de Aquisi????o sem Incid??ncia da Contribui????o', 74),
            (u'75 - Opera????o de Aquisi????o por Substitui????o Tribut??ria', 75),
            (u'98 - Outras Opera????es de Entrada', 98),
            (u'99 - Outras Opera????es', 99),
        ),
        'calculo': (
            (u'Percentual', 'percentage'),
        )
    }

    # This widgets should be enabled when this option is selected.
    MAP_VALID_WIDGETS = {
        0: ['cst'],
        1: ['cst', 'p_cofins'],
        2: ['cst', 'p_cofins'],
        4: ['cst'],
        5: ['cst'],
        6: ['cst'],
        7: ['cst'],
        8: ['cst'],
        9: ['cst'],
        49: ['cst', 'calculo', 'p_cofins'],
        50: ['cst', 'calculo', 'p_cofins'],
        51: ['cst', 'calculo', 'p_cofins'],
        52: ['cst', 'calculo', 'p_cofins'],
        53: ['cst', 'calculo', 'p_cofins'],
        54: ['cst', 'calculo', 'p_cofins'],
        55: ['cst', 'calculo', 'p_cofins'],
        56: ['cst', 'calculo', 'p_cofins'],
        60: ['cst', 'calculo', 'p_cofins'],
        61: ['cst', 'calculo', 'p_cofins'],
        62: ['cst', 'calculo', 'p_cofins'],
        63: ['cst', 'calculo', 'p_cofins'],
        64: ['cst', 'calculo', 'p_cofins'],
        65: ['cst', 'calculo', 'p_cofins'],
        66: ['cst', 'calculo', 'p_cofins'],
        67: ['cst', 'calculo', 'p_cofins'],
        70: ['cst', 'calculo', 'p_cofins'],
        71: ['cst', 'calculo', 'p_cofins'],
        72: ['cst', 'calculo', 'p_cofins'],
        73: ['cst', 'calculo', 'p_cofins'],
        74: ['cst', 'calculo', 'p_cofins'],
        75: ['cst', 'calculo', 'p_cofins'],
        98: ['cst', 'calculo', 'p_cofins'],
        99: ['cst', 'calculo', 'p_cofins'],
    }

    #
    # Public API
    #

    def setup_proxies(self):
        self._setup_widgets()
        self.proxy = self.add_proxy(self.model, self.proxy_widgets)
        self._update_selected_cst()

    #
    # Private API
    #

    def _update_selected_cst(self):
        cst = self.cst.get_selected_data()
        valid_widgets = self.MAP_VALID_WIDGETS.get(cst, ('cst', ))
        self.set_valid_widgets(valid_widgets)

    def _update_selected_calculo(self):
        # When the CST is contained in the list the calculation is not performed
        # because the taxpayer is exempt.
        if self.model.cst in [0, 4, 5, 6, 7, 8, 9]:
            return

        calculo = self.calculo.get_selected_data()
        if calculo == ProductCofinsTemplate.CALC_PERCENTAGE:
            self.p_cofins.set_sensitive(True)

    #
    # Kiwi callbacks
    #

    def on_cst__changed(self, widget):
        self._update_selected_cst()

    def on_calculo__changed(self, widget):
        self._update_selected_calculo()

    def on_p_cofins__validate(self, widget, value):
        if not 0 <= value <= 100:
            return ValidationError(_('The COFINS aliquot must be between 0 and 100'))


class InvoiceItemCofinsSlave(BaseCOFINSSlave, InvoiceItemMixin):
    model_type = InvoiceItemCofins
    proxy_widgets = BaseCOFINSSlave.all_widgets

    def __init__(self, store, model, invoice_item):
        self.invoice_item = invoice_item
        BaseCOFINSSlave.__init__(self, store, model)

    def create_model(self, store):
        model = InvoiceItemCofins(store=store)
        self.invoice_item.cofins_info = model
        return model

    #
    # Public API
    #

    def setup_callbacks(self):
        self.fill_combo(self.template, ProductTaxTemplate.TYPE_COFINS)
        self.p_cofins.connect_after('changed', self._after_field__changed)
        self.cst.connect_after('changed', self._after_field__changed)

    def update_values(self, widgets=None):
        self.model.update_values(self.invoice_item)
        widgets = widgets or ['v_cofins']
        for name in widgets:
            if name == 'cst':
                continue
            self.proxy.update(name)

        # We need to update cst last: Since when one of those is
        # changed we change some widgets sensitivity, when changing the widget
        # sensitivity, kiwi will reset the model value incorrectly.
        self.proxy.update('cst')

    #
    # Kiwi Callbacks
    #

    def _after_field__changed(self, widget):
        if not self.proxy or self.is_updating:
            return

        self.update_values()


class COFINSTemplateSlave(BaseCOFINSSlave):
    model_type = ProductCofinsTemplate
    proxy_widgets = (BaseCOFINSSlave.combo_widgets +
                     BaseCOFINSSlave.percentage_widgets)
    hide_widgets = BaseCOFINSSlave.value_widgets + ['template']
