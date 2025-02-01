import 'package:mobx/mobx.dart';

part 'order_form_store.g.dart';

class OrderFormStore = _OrderFormStore with _$OrderFormStore;

abstract class _OrderFormStore with Store {
  @observable
  String paymentMethod = 'cash'; // Default payment method

  @observable
  String? selectedAddress;

  @action
  void setPaymentMethod(String method) {
    paymentMethod = method;
  }

  @action
  void setSelectedAddress(String? address) {
    selectedAddress = address;
  }
} 