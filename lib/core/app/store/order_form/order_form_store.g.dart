// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderFormStore on _OrderFormStore, Store {
  late final _$paymentMethodAtom =
      Atom(name: '_OrderFormStore.paymentMethod', context: context);

  @override
  String get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  late final _$selectedAddressAtom =
      Atom(name: '_OrderFormStore.selectedAddress', context: context);

  @override
  String? get selectedAddress {
    _$selectedAddressAtom.reportRead();
    return super.selectedAddress;
  }

  @override
  set selectedAddress(String? value) {
    _$selectedAddressAtom.reportWrite(value, super.selectedAddress, () {
      super.selectedAddress = value;
    });
  }

  late final _$_OrderFormStoreActionController =
      ActionController(name: '_OrderFormStore', context: context);

  @override
  void setPaymentMethod(String method) {
    final _$actionInfo = _$_OrderFormStoreActionController.startAction(
        name: '_OrderFormStore.setPaymentMethod');
    try {
      return super.setPaymentMethod(method);
    } finally {
      _$_OrderFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedAddress(String? address) {
    final _$actionInfo = _$_OrderFormStoreActionController.startAction(
        name: '_OrderFormStore.setSelectedAddress');
    try {
      return super.setSelectedAddress(address);
    } finally {
      _$_OrderFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paymentMethod: ${paymentMethod},
selectedAddress: ${selectedAddress}
    ''';
  }
}
