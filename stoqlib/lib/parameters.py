# -*- coding: utf-8 -*-
# vi:si:et:sw=4:sts=4:ts=4

##
## Copyright (C) 2005-2011 Async Open Source
##
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU Lesser General Public License
## as published by the Free Software Foundation; either version 2
## of the License, or (at your option) any later version.
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
##
## Author(s): Stoq Team <stoq-devel@async.com.br>
##
""" Parameters and system data for applications"""

from decimal import Decimal
import os

from kiwi.argcheck import argcheck
from kiwi.datatypes import ValidationError
from kiwi.log import Logger
from kiwi.python import namedAny, ClassInittableObject
from stoqdrivers.enum import TaxType

import stoqlib
from stoqlib.database.runtime import new_transaction
from stoqlib.domain.parameter import ParameterData
from stoqlib.domain.interfaces import ISupplier, IBranch
from stoqlib.exceptions import DatabaseInconsistency
from stoqlib.lib.imageutils import ImageHelper
from stoqlib.lib.translation import stoqlib_gettext
from stoqlib.lib.validators import (validate_int,
                                    validate_decimal,
                                    validate_directory,
                                    validate_area_code,
                                    validate_percentage,
                                    validate_state)
from stoqlib.lib.barcode import BarcodeInfo

_ = stoqlib_gettext

class DirectoryParameter(object):
    def __init__(self, path):
        self.path = path


log = Logger('stoqlib.parameters')

class ParameterDetails:
    def __init__(self, group, short_desc, long_desc):
        self.group = group
        self.short_desc = short_desc
        self.long_desc = long_desc

_parameter_info = dict(
    EDIT_CODE_PRODUCT=ParameterDetails(
     ('Products'),
     ('Disable edit code products'),
     ('Disable edit code products on purchase application')),

    MAIN_COMPANY=ParameterDetails(
    _('General'),
    _('Primary company'),
    _('The primary company which is the owner of all other branch companies')),

    CUSTOM_LOGO_FOR_REPORTS=ParameterDetails(
    _('General'),
    _('Custom logotype for reports'),
    _('Defines a custom logo for all the reports generated by Stoq. '
      'The recommended image dimension is 171x59 (pixels), if needed, '
      'the image will be resized. In order to use the default logotype '
      'leave this field blank')),

    DISABLE_COOKIES=ParameterDetails(
    _('General'),
    _('Disable cookies'),
    _('Disable the ability to use cookies in order to automatic log in '
      'the system. If so, all the users will have to provide the password '
      'everytime they log in. Requires restart to take effect.')),

    DEFAULT_SALESPERSON_ROLE=ParameterDetails(
    _('Sales'),
    _('Default salesperson role'),
    _('Defines which of the employee roles existent in the system is the '
      'salesperson role')),

    SUGGESTED_SUPPLIER=ParameterDetails(
    _('Purchase'),
    _('Suggested supplier'),
    _('The supplier suggested when we are adding a new product in the '
      'system')),

    SUGGESTED_UNIT=ParameterDetails(
    _('Purchase'),
    _('Suggested unit'),
    _('The unit suggested when we are adding a new product in the '
      'system')),

    DEFAULT_BASE_CATEGORY=ParameterDetails(
    _('Purchase'),
    _('Default base sellable category'),
    _('A default base sellable category which we always get as a '
      'suggestion when adding a new Sellable on the system')),

    ALLOW_OUTDATED_PURCHASES=ParameterDetails(
    _('Purchase'),
    _('Allow outdated purchases'),
    _('Allows the inclusion of purchases done previously than the '
      'current date.')),

    DELIVERY_SERVICE=ParameterDetails(
    _('Sales'),
    _('Delivery service'),
    _('The default delivery service in the system.')),

    USE_LOGIC_QUANTITY=ParameterDetails(
    _('Stock'),
    _('Use logic quantity'),
    _('An integer that defines if the company can work or not with '
      'logic quantities during stock operations. See StockItem '
      'documentation.')),

    # XXX This parameter is Stoq-specific. How to deal with that
    # in a better way?
    POS_FULL_SCREEN=ParameterDetails(
    _('Sales'),
    _('Show POS application in Fullscreen'),
    _('Once this parameter is set the Point of Sale application '
      'will be showed as full screen')),

    POS_SEPARATE_CASHIER=ParameterDetails(
    _('Sales'),
    _('Exclude cashier operations in Point of Sale'),
    _('If you have a computer that will be a Point of Sales and have a '
      'fiscal printer connected, set this False, so the Till menu will '
      'appear on POS. If you prefer to separate the Till menu from POS '
      'set this True.')),

    ENABLE_PAULISTA_INVOICE=ParameterDetails(
    _('Sales'),
    _('Enable paulista invoice'),
    _('Once this parameter is set, we will be able to join to the '
      'Sao Paulo state program of fiscal commitment.')),

    CITY_SUGGESTED=ParameterDetails(
    _('General'),
    _('Default city'),
    _('When adding a new address for a certain person we will always '
      'suggest this city.')),

    STATE_SUGGESTED=ParameterDetails(
    _('General'),
    _('Default state'),
    _('When adding a new address for a certain person we will always '
      'suggest this state.')),

    COUNTRY_SUGGESTED=ParameterDetails(
    _('General'),
    _('Default country'),
    _('When adding a new address for a certain person we will always '
      'suggest this country.')),

    HAS_DELIVERY_MODE=ParameterDetails(
    _('Sales'),
    _('Has delivery mode'),
    _('Does this branch work with delivery service? If not, the '
      'delivery option will be disable on Point of Sales Application.')),

    SHOW_COST_COLUMN_IN_SALES=ParameterDetails(
    _('Sales'),
    _('Show cost column in sales'),
    _('should the cost column be displayed when creating a new sale quote.'
      )),

    MAX_SEARCH_RESULTS=ParameterDetails(
    _('General'),
    _('Max search results'),
    _('The maximum number of results we must show after searching '
      'in any dialog.')),

    CONFIRM_SALES_ON_TILL=ParameterDetails(
    _('Sales'),
    _('Confirm sales in Till'),
    _('Once this parameter is set, the sales confirmation are only made '
      'on till application and the fiscal coupon will be printed on '
      'that application instead of Point of Sales')),

    ACCEPT_CHANGE_SALESPERSON=ParameterDetails(
    _('Sales'),
    _('Change salesperson'),
    _('Once this parameter is set to true, the user will be '
      'able to change the salesperson of an opened '
      'order on sale checkout dialog')),

    RETURN_MONEY_ON_SALES=ParameterDetails(
    _('Sales'),
    _('Return money on sales'),
    _('Once this parameter is set the salesperson can return '
      'money to clients when there is overpaid values in sales '
      'with gift certificates as payment method.')),

    MAX_SALE_DISCOUNT=ParameterDetails(
    _('Sales'),
    _('Max discount for sales'),
    _('The max discount for salesperson in a sale')),

    SALE_PAY_COMMISSION_WHEN_CONFIRMED=ParameterDetails(
    _('Sales'),
    _('Commission Payment At Sale Confirmation'),
    _('Define whether the commission is paid when a sale is confirmed. '
       'If True pay the commission when a sale is confirmed, '
       'if False, pay a relative commission for each commission when '
       'the sales payment is paid.')),

    DEFAULT_OPERATION_NATURE=ParameterDetails(
    _('Sales'),
    _('Default operation nature'),
    _('When adding a new sale quote, we will always suggest '
      'this operation nature')),

    # XXX: These parameters are Brazil-specific
    ASK_SALES_CFOP=ParameterDetails(
    _('Sales'),
    _('Ask for Sale Order C.F.O.P.'),
    _('Once this parameter is set to True we will ask for the C.F.O.P. '
      'when creating new sale orders')),

    DEFAULT_SALES_CFOP=ParameterDetails(
    _('Sales'),
    _('Default Sales C.F.O.P.'),
    _('Default C.F.O.P. (Fiscal Code of Operations) used when generating '
      'fiscal book entries.')),

    DEFAULT_RETURN_SALES_CFOP=ParameterDetails(
    _('Sales'),
    _('Default Return Sales C.F.O.P.'),
    _('Default C.F.O.P. (Fiscal Code of Operations) used when returning '
      'sale orders ')),

    DEFAULT_RECEIVING_CFOP=ParameterDetails(
    _('Purchase'),
    _('Default Receiving C.F.O.P.'),
    _('Default C.F.O.P. (Fiscal Code of Operations) used when receiving '
      'products in the stock application.')),

    DEFAULT_STOCK_DECREASE_CFOP=ParameterDetails(
    _('Stock'),
    _('Default C.F.O.P. for Stock Decreases'),
    _('Default C.F.O.P. (Fiscal Code of Operations) used when performing a '
      'manual stock decrease.')),

    ICMS_TAX=ParameterDetails(
    _('Sales'),
    _('Default ICMS tax'),
    _('Default ICMS to be applied on all the products of a sale. ') +
      ' ' + _('This is a percentage value and must be between 0 and 100.') + ' '
      + _('E.g: 18, which means 18% of tax.')),

    ISS_TAX=ParameterDetails(
    _('Sales'),
    _('Default ISS tax'),
    _('Default ISS to be applied on all the services of a sale. ') +
      ' ' + _('This is a percentage value and must be between 0 and 100.') + ' '
      + _('E.g: 12, which means 12% of tax.')),

    SUBSTITUTION_TAX=ParameterDetails(
    _('Sales'),
    _('Default Substitution tax'),
    _('The tax applied on all sale products with substitution tax type.') +
      ' ' + _('This is a percentage value and must be between 0 and 100.') + ' '
      + _('E.g: 16, which means 16% of tax.')),

    DEFAULT_AREA_CODE=ParameterDetails(
    _('General'),
    _('Default area code'),
    _('This is the default area code which will be used when '
      'registering new clients, users and more to the system')),

    DEFAULT_PRODUCT_TAX_CONSTANT=ParameterDetails(
    _('Sales'),
    _('Default tax constant for products'),
    _('This is the default tax constant which will be used '
      'when adding new products to the system')),

    CAT52_DEST_DIR=ParameterDetails(
    _('General'),
    _('Cat 52 destination directory'),
    _('Where the file generated after a Z-reduction should be saved.')),

    USE_FOUR_PRECISION_DIGITS=ParameterDetails(
    _('General'),
    _('Use four precision digits'),
    _('Once this parameter is set, the products cost will be expressed '
       'using four precision digits.')),

    SCALE_BARCODE_FORMAT=ParameterDetails(
    _('Sales'),
    _('Scale barcode format'),
    _('Format used by the barcode printed by the scale. This format always'
       ' starts with 2 followed by 4,5 or 6 digits product code and by a 5'
       ' digit weight or a 6 digit price. Check or scale documentation and'
       ' configuration to see the best option.')),

    NFE_SERIAL_NUMBER=ParameterDetails(
    _('NF-e'),
    _('Fiscal document serial number'),
    _('Fiscal document serial number. Fill with 0 if the NF-e have no '
       'series. This parameter only has effect if the nfe plugin is enabled.')),

    NFE_DANFE_ORIENTATION=ParameterDetails(
    _('NF-e'),
    _('Danfe printing orientation'),
    _('Orientation to use for printing danfe. Portrait or Landscape')),

    NFE_FISCO_INFORMATION=ParameterDetails(
    _('NF-e'),
    _('Additional Information for the Fisco'),
    _('Additional information to add to the NF-e for the Fisco')),

    BANKS_ACCOUNT=ParameterDetails(
    _('Accounts'),
    _('Parent bank account'),
    _('Newly nank accounts will be placed under this account, '
       'for accounts imported via OFX will be created below this')),

    TILLS_ACCOUNT=ParameterDetails(
    _('Accounts'),
    _('Parent till account'),
    _('Till account transfers will be placed under this account')),

    IMBALANCE_ACCOUNT=ParameterDetails(
    _('Accounts'),
    _('Imbalance account'),
    _('Account used for unbalanced transactions')),

    DEMO_MODE=ParameterDetails(
    _('General'),
    _('Demonstration mode'),
    _('If Stoq is used in a demonstration mode')),
)

class ParameterAttr:
    def __init__(self, key, type, initial=None, options=None,
                 multiline=False, validator=None):
        self.key = key
        self.type = type
        self.initial = initial
        self.options = options
        self.multiline = multiline
        self.validator = validator

    #
    #  Public API
    #

    def get_parameter_type(self):
        if isinstance(self.type, basestring):
            return namedAny('stoqlib.domain.' + self.type)
        else:
            return self.type

    def get_parameter_validator(self):
        return self.validator or self._get_generic_parameter_validator()

    #
    #  Staticmethods
    #

    @staticmethod
    def validate_int(value):
        if not validate_int(value):
            return ValidationError(_("This parameter only accepts "
                                     "integer values."))

    @staticmethod
    def validate_decimal(value):
        if not validate_decimal(value):
            return ValidationError(_("This parameter only accepts "
                                     "decimal values."))

    @staticmethod
    def validate_directory(path):
        if not validate_directory(path):
            return ValidationError(_("'%s is not a valid path.'" % path))

    @staticmethod
    def validate_area_code(code):
        if not validate_area_code(code):
            return ValidationError(_("'%s' is not a valid area code.\n"
                                     "Valid area codes are on 10-99 range.")
                                   % code)

    @staticmethod
    def validate_percentage(value):
        if not validate_percentage(value):
            return ValidationError(_("'%s' is not a valid percentage.")
                                   % value)

    @staticmethod
    def validate_state(state):
        if not validate_state(state):
            return ValidationError(_("'%s' is not a valid state.")
                                   % state)

    #
    #  Private API
    #

    def _get_generic_parameter_validator(self):
        p_type = self.get_parameter_type()

        if issubclass(p_type, int):
            return ParameterAttr.validate_int
        elif issubclass(p_type, Decimal):
            return ParameterAttr.validate_decimal
        elif issubclass(p_type, DirectoryParameter):
            return ParameterAttr.validate_directory


class ParameterAccess(ClassInittableObject):
    """A mechanism to tie specific instances to constants that can be
    made available cross-application. This class has a special hook that
    allows the values to be looked up on-the-fly and cached.

    Usage:

    >>> from stoqlib.lib.parameters import sysparam
    >>> from stoqlib.database.runtime import get_connection
    >>> conn = get_connection()
    >>> parameter = sysparam(conn).parameter_name
    """

    default_fisco_message = \
            'Documento emitido por ME ou EPP optante pelo SIMPLES' \
            ' NACIONAL. Não gera Direito a Crédito Fiscal de ICMS e de'\
            ' ISS. Conforme Lei Complementar 123 de 14/12/2006.'

    # New parameters must always be defined here
    constants = [
        # Adding constants
        ParameterAttr('EDIT_CODE_PRODUCT', bool, initial=False),
        ParameterAttr('USE_LOGIC_QUANTITY', bool, initial=True),
        ParameterAttr('POS_FULL_SCREEN', bool, initial=False),
        ParameterAttr('HAS_DELIVERY_MODE', bool, initial=True),
        ParameterAttr('SHOW_COST_COLUMN_IN_SALES', bool, initial=False),
        ParameterAttr('ACCEPT_CHANGE_SALESPERSON', bool, initial=False),
        ParameterAttr('ENABLE_PAULISTA_INVOICE', bool, initial=False),
        ParameterAttr('MAX_SEARCH_RESULTS', int, initial=600),
        ParameterAttr('CITY_SUGGESTED', str, initial='Sao Carlos'),
        ParameterAttr('STATE_SUGGESTED', str, initial='SP',
                      validator=ParameterAttr.validate_state),
        ParameterAttr('COUNTRY_SUGGESTED', str, initial='Brazil'),
        ParameterAttr('CONFIRM_SALES_ON_TILL', bool, initial=False),
        ParameterAttr('RETURN_MONEY_ON_SALES', bool, initial=True),
        ParameterAttr('ASK_SALES_CFOP', bool, initial=False),
        ParameterAttr('MAX_SALE_DISCOUNT', Decimal, initial=5,
                      validator=ParameterAttr.validate_percentage),
        ParameterAttr('ICMS_TAX', Decimal, initial=18,
                      validator=ParameterAttr.validate_percentage),
        ParameterAttr('ISS_TAX', Decimal, initial=18,
                      validator=ParameterAttr.validate_percentage),
        ParameterAttr('SUBSTITUTION_TAX', Decimal, initial=18,
                      validator=ParameterAttr.validate_percentage),
        ParameterAttr('POS_SEPARATE_CASHIER', bool, initial=False),
        ParameterAttr('DEFAULT_AREA_CODE', int, initial=16,
                      validator=ParameterAttr.validate_area_code),
        ParameterAttr('SALE_PAY_COMMISSION_WHEN_CONFIRMED', bool,
                       initial=False),
        ParameterAttr('DEFAULT_OPERATION_NATURE', str, initial=_('Sale')),
        ParameterAttr('CUSTOM_LOGO_FOR_REPORTS', ImageHelper, initial=''),
        ParameterAttr('CAT52_DEST_DIR', DirectoryParameter, initial='~/.stoq/cat52'),
        ParameterAttr('ALLOW_OUTDATED_PURCHASES', bool, initial=False),
        ParameterAttr('USE_FOUR_PRECISION_DIGITS', bool, initial=False),
        ParameterAttr('DISABLE_COOKIES', bool, initial=False),
        ParameterAttr('NFE_SERIAL_NUMBER', int, initial=1),
        ParameterAttr('NFE_FISCO_INFORMATION', str,
                      initial=default_fisco_message, multiline=True),
        ParameterAttr('NFE_DANFE_ORIENTATION', int, initial=0,
                      options={0: _('Portrait'),
                               1: _('Landscape')}
                               ),
        ParameterAttr('SCALE_BARCODE_FORMAT', int, initial=0,
                      options=BarcodeInfo.options),
        ParameterAttr('DEMO_MODE', bool, initial=False),
        # Adding objects -- Note that all the object referred here must
        # implements the IDescribable interface.
        ParameterAttr('DEFAULT_SALES_CFOP', 'fiscal.CfopData'),
        ParameterAttr('DEFAULT_RETURN_SALES_CFOP', 'fiscal.CfopData'),
        ParameterAttr('DEFAULT_RECEIVING_CFOP', 'fiscal.CfopData'),
        ParameterAttr('DEFAULT_STOCK_DECREASE_CFOP', 'fiscal.CfopData'),
        ParameterAttr('SUGGESTED_SUPPLIER',
                      'person.PersonAdaptToSupplier'),
        ParameterAttr('SUGGESTED_UNIT',
                      'sellable.SellableUnit'),
        ParameterAttr('MAIN_COMPANY',
                      'person.PersonAdaptToBranch'),
        ParameterAttr('DEFAULT_BASE_CATEGORY',
                      'sellable.SellableCategory'),
        ParameterAttr('DEFAULT_SALESPERSON_ROLE',
                      'person.EmployeeRole'),
        ParameterAttr('DELIVERY_SERVICE',
                      'service.Service'),
        ParameterAttr('DEFAULT_PRODUCT_TAX_CONSTANT',
                      'sellable.SellableTaxConstant'),
        ParameterAttr('BANKS_ACCOUNT',
                      'account.Account'),
        ParameterAttr('TILLS_ACCOUNT',
                      'account.Account'),
        ParameterAttr('IMBALANCE_ACCOUNT',
                      'account.Account'),
        ]

    _cache = {}

    @classmethod
    def __class_init__(cls, namespace):
        for obj in cls.constants:
            getter = lambda self, n=obj.key, v=obj.type: (
                self.get_parameter_by_field(n, v))
            setter = lambda self, value, n=obj.key: (
                self._set_schema(n, value))
            prop = property(getter, setter)
            setattr(cls, obj.key, prop)

    def __init__(self, conn):
        ClassInittableObject.__init__(self)
        self.conn = conn

    def _remove_unused_parameters(self):
        """Remove any  parameter found in ParameterData table which is not
        used any longer.
        """
        for param in ParameterData.select(connection=self.conn):
            if param.field_name not in _parameter_info.keys():
                ParameterData.delete(param.id, connection=self.conn)

    def _set_schema(self, field_name, field_value, is_editable=True):
        if field_value is not None:
            field_value = str(field_value)

        data = ParameterData.selectOneBy(connection=self.conn,
                                         field_name=field_name)
        if data is None:
            ParameterData(connection=self.conn,
                          field_name=field_name,
                          field_value=field_value,
                          is_editable=is_editable)
        else:
            data.field_value = field_value

    #
    # Public API
    #

    @argcheck(str, object)
    def update_parameter(self, parameter_name, value):
        if parameter_name in ['DEMO_MODE']:
            raise AssertionError
        param = get_parameter_by_field(parameter_name, self.conn)
        param.field_value = str(value)
        self.rebuild_cache_for(parameter_name)

    def rebuild_cache_for(self, param_name):
        from stoqlib.domain.base import AbstractModel
        try:
            value = self._cache[param_name]
        except KeyError:
            return

        param = get_parameter_by_field(param_name, self.conn)
        value_type = type(value)
        if not issubclass(value_type, AbstractModel):
            # XXX: workaround to works with boolean types:
            data = param.field_value
            if value_type is bool:
                data = int(data)
            self._cache[param_name] = value_type(data)
            return
        table = value_type
        obj_id = param.field_value
        self._cache[param_name] = table.get(obj_id, connection=self.conn)

    def rebuild_cache(self):
        map(self.rebuild_cache_for, self._cache.keys())

    def clear_cache(self):
        log.info("Clearing cache")
        ParameterAccess._cache = {}

    def get_parameter_constant(self, field_name):
        for constant in ParameterAccess.constants:
            if constant.key == field_name:
                return constant
        else:
            raise KeyError("No such a parameter: %s" % (field_name,))

    def get_parameter_type(self, field_name):
        constant = self.get_parameter_constant(field_name)

        if isinstance(constant.type, basestring):
            return namedAny('stoqlib.domain.' + constant.type)
        else:
            return constant.type

    def get_parameter_by_field(self, field_name, field_type):
        from stoqlib.domain.base import AbstractModel
        if isinstance(field_type, basestring):
            field_type = namedAny('stoqlib.domain.' + field_type)
        if self._cache.has_key(field_name):
            param = self._cache[field_name]
            if issubclass(field_type, AbstractModel):
                return field_type.get(param.id, connection=self.conn)
            elif issubclass(field_type, (ImageHelper, DirectoryParameter)):
                return param
            else:
                return field_type(param)
        value = ParameterData.selectOneBy(field_name=field_name,
                                          connection=self.conn)
        if value is None:
            return
        if issubclass(field_type, AbstractModel):
            if value.field_value == '' or value.field_value is None:
                return
            param = field_type.get(value.field_value, connection=self.conn)
        else:
            # XXX: workaround to works with boolean types:
            value = value.field_value
            if field_type is bool:
                if value == 'True':
                    value = True
                elif value == 'False':
                    value = False
                else:
                    value = bool(int(value))
            param = field_type(value)
        self._cache[field_name] = param
        return param

    def set_defaults(self, update=False):
        self._remove_unused_parameters()
        constants = [c for c in self.constants if c.initial is not None]

        # Creating constants
        for obj in constants:
            if (update and self.get_parameter_by_field(obj.key, obj.type)
                is not None):
                continue

            if obj.type is bool:
                # Convert Bool to int here
                value = int(obj.initial)
            else:
                value = obj.initial
            self._set_schema(obj.key, value)

        # Creating system objects
        # When creating new methods for system objects creation add them
        # always here
        self.ensure_default_sales_cfop()
        self.ensure_default_return_sales_cfop()
        self.ensure_default_receiving_cfop()
        self.ensure_default_stock_decrease_cfop()
        self.ensure_suggested_supplier()
        self.ensure_suggested_unit()
        self.ensure_default_base_category()
        self.ensure_default_salesperson_role()
        self.ensure_main_company()
        self.ensure_delivery_service()
        self.ensure_product_tax_constant()

    #
    # Methods for system objects creation
    #

    def ensure_suggested_supplier(self):
        key = "SUGGESTED_SUPPLIER"
        from stoqlib.domain.person import Person
        if self.get_parameter_by_field(key, Person.getAdapterClass(ISupplier)):
            return
        self._set_schema(key, None)

    def ensure_suggested_unit(self):
        key = "SUGGESTED_UNIT"
        from stoqlib.domain.sellable import SellableUnit
        if self.get_parameter_by_field(key, SellableUnit):
            return
        self._set_schema(key, None)

    def ensure_default_base_category(self):
        from stoqlib.domain.sellable import SellableCategory
        key = "DEFAULT_BASE_CATEGORY"
        if self.get_parameter_by_field(key, SellableCategory):
            return
        base_category = SellableCategory(description=key,
                                         connection=self.conn)
        self._set_schema(key, base_category.id)

    def ensure_default_salesperson_role(self):
        from stoqlib.domain.person import EmployeeRole
        key = "DEFAULT_SALESPERSON_ROLE"
        if self.get_parameter_by_field(key, EmployeeRole):
            return
        role = EmployeeRole(name='Salesperson',
                            connection=self.conn)
        self._set_schema(key, role.id, is_editable=False)

    def ensure_main_company(self):
        from stoqlib.domain.person import Person
        key = "MAIN_COMPANY"
        if self.get_parameter_by_field(key, Person.getAdapterClass(IBranch)):
            return
        self._set_schema(key, None)

    def ensure_delivery_service(self):
        from stoqlib.domain.service import Service
        key = "DELIVERY_SERVICE"
        if self.get_parameter_by_field(key, Service):
            return

        self.create_delivery_service()

    def create_delivery_service(self):
        from stoqlib.domain.sellable import (BaseSellableInfo,
                                             Sellable,
                                             SellableTaxConstant)
        from stoqlib.domain.service import Service
        key = "DELIVERY_SERVICE"
        tax_constant = SellableTaxConstant.get_by_type(TaxType.SERVICE, self.conn)
        sellable_info = BaseSellableInfo(connection=self.conn,
                                         description=_('Delivery'))
        sellable = Sellable(tax_constant=tax_constant,
                            base_sellable_info=sellable_info,
                            connection=self.conn)
        service = Service(sellable=sellable, connection=self.conn)
        self._set_schema(key, service.id)

    def _ensure_cfop(self, key, description, code):
        from stoqlib.domain.fiscal import CfopData
        if self.get_parameter_by_field(key, CfopData):
            return
        data = CfopData.selectOneBy(code=code, connection=self.conn)
        if not data:
            data = CfopData(code=code, description=description,
                            connection=self.conn)
        self._set_schema(key, data.id)

    def ensure_default_return_sales_cfop(self):
        self._ensure_cfop("DEFAULT_RETURN_SALES_CFOP",
                          "Devolucao",
                          "5.202")

    def ensure_default_sales_cfop(self):
        self._ensure_cfop("DEFAULT_SALES_CFOP",
                          "Venda de Mercadoria Adquirida",
                          "5.102")

    def ensure_default_receiving_cfop(self):
        self._ensure_cfop("DEFAULT_RECEIVING_CFOP",
                          "Compra para Comercializacao",
                          "1.102")

    def ensure_default_stock_decrease_cfop(self):
        self._ensure_cfop("DEFAULT_STOCK_DECREASE_CFOP",
                          "Outra saída de mercadoria ou "
                          "prestação de serviço não especificado",
                          "5.949")

    def ensure_product_tax_constant(self):
        from stoqlib.domain.sellable import SellableTaxConstant
        key = "DEFAULT_PRODUCT_TAX_CONSTANT"
        if self.get_parameter_by_field(key, SellableTaxConstant):
            return

        tax_constant = SellableTaxConstant.get_by_type(TaxType.NONE, self.conn)
        self._set_schema(key, tax_constant.id)


#
# General routines
#


def sysparam(conn):
    return ParameterAccess(conn)


# FIXME: Move to a classmethod on ParameterData
def get_parameter_by_field(field_name, conn):
    data = ParameterData.selectOneBy(field_name=field_name,
                                     connection=conn)
    if data is None:
        raise DatabaseInconsistency(
            "Can't find a ParameterData object for the key %s" %
            field_name)
    return data


def get_foreign_key_parameter(field_name, conn):
    parameter = get_parameter_by_field(field_name, conn)
    if not (parameter and parameter.foreign_key):
        msg = _('There is no defined %s parameter data'
                'in the database.' % field_name)
        raise DatabaseInconsistency(msg)
    return parameter


def get_parameter_details(field_name):
    """ Returns a ParameterDetails class for the given parameter name, or
    None if the name supplied isn't a valid parameter name.
    """
    try:
        return _parameter_info[field_name]
    except KeyError:
        raise NameError("Does not exists no parameters "
                        "with name %s" % field_name)


#
# Ensuring everything
#

def check_parameter_presence(conn):
    """Check so the number of installed parameters are equal to
    the number of available ones
    @returns: True if they're up to date, False otherwise
    """

    results = ParameterData.select(connection=conn)

    return results.count() == len(_parameter_info)

def ensure_system_parameters(update=False):
    log.info("Creating default system parameters")
    trans = new_transaction()
    param = sysparam(trans)
    param.set_defaults(update)
    trans.commit(close=True)

def is_developer_mode():
    if os.environ.get('STOQ_DEVELOPER_MODE') == '0':
        return
    return stoqlib.library.uninstalled
