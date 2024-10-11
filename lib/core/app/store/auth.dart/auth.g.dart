// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthTech on AuthTechStore, Store {
  late final _$passVisibAtom =
      Atom(name: 'AuthTechStore.passVisib', context: context);

  @override
  bool get passVisib {
    _$passVisibAtom.reportRead();
    return super.passVisib;
  }

  @override
  set passVisib(bool value) {
    _$passVisibAtom.reportWrite(value, super.passVisib, () {
      super.passVisib = value;
    });
  }

  late final _$passAtom = Atom(name: 'AuthTechStore.pass', context: context);

  @override
  String get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  late final _$secondpassAtom =
      Atom(name: 'AuthTechStore.secondpass', context: context);

  @override
  String get secondpass {
    _$secondpassAtom.reportRead();
    return super.secondpass;
  }

  @override
  set secondpass(String value) {
    _$secondpassAtom.reportWrite(value, super.secondpass, () {
      super.secondpass = value;
    });
  }

  late final _$nameAtom = Atom(name: 'AuthTechStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$surnameAtom =
      Atom(name: 'AuthTechStore.surname', context: context);

  @override
  String get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  late final _$emailAtom = Atom(name: 'AuthTechStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$balanceAtom =
      Atom(name: 'AuthTechStore.balance', context: context);

  @override
  int get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(int value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$balanceAdditionAtom =
      Atom(name: 'AuthTechStore.balanceAddition', context: context);

  @override
  int get balanceAddition {
    _$balanceAdditionAtom.reportRead();
    return super.balanceAddition;
  }

  @override
  set balanceAddition(int value) {
    _$balanceAdditionAtom.reportWrite(value, super.balanceAddition, () {
      super.balanceAddition = value;
    });
  }

  late final _$totalpriceAtom =
      Atom(name: 'AuthTechStore.totalprice', context: context);

  @override
  int get totalprice {
    _$totalpriceAtom.reportRead();
    return super.totalprice;
  }

  @override
  set totalprice(int value) {
    _$totalpriceAtom.reportWrite(value, super.totalprice, () {
      super.totalprice = value;
    });
  }

  late final _$enterPassAtom =
      Atom(name: 'AuthTechStore.enterPass', context: context);

  @override
  String get enterPass {
    _$enterPassAtom.reportRead();
    return super.enterPass;
  }

  @override
  set enterPass(String value) {
    _$enterPassAtom.reportWrite(value, super.enterPass, () {
      super.enterPass = value;
    });
  }

  late final _$enterEmailAtom =
      Atom(name: 'AuthTechStore.enterEmail', context: context);

  @override
  String get enterEmail {
    _$enterEmailAtom.reportRead();
    return super.enterEmail;
  }

  @override
  set enterEmail(String value) {
    _$enterEmailAtom.reportWrite(value, super.enterEmail, () {
      super.enterEmail = value;
    });
  }

  late final _$isUserAtom =
      Atom(name: 'AuthTechStore.isUser', context: context);

  @override
  bool get isUser {
    _$isUserAtom.reportRead();
    return super.isUser;
  }

  @override
  set isUser(bool value) {
    _$isUserAtom.reportWrite(value, super.isUser, () {
      super.isUser = value;
    });
  }

  late final _$usersCartAtom =
      Atom(name: 'AuthTechStore.usersCart', context: context);

  @override
  ObservableList<String> get usersCart {
    _$usersCartAtom.reportRead();
    return super.usersCart;
  }

  @override
  set usersCart(ObservableList<String> value) {
    _$usersCartAtom.reportWrite(value, super.usersCart, () {
      super.usersCart = value;
    });
  }

  late final _$doesUserExistAsyncAction =
      AsyncAction('AuthTechStore.doesUserExist', context: context);

  @override
  Future<void> doesUserExist(String emailForEnter, String passForEnter) {
    return _$doesUserExistAsyncAction
        .run(() => super.doesUserExist(emailForEnter, passForEnter));
  }

  late final _$AuthTechStoreActionController =
      ActionController(name: 'AuthTechStore', context: context);

  @override
  void changerPass() {
    final _$actionInfo = _$AuthTechStoreActionController.startAction(
        name: 'AuthTechStore.changerPass');
    try {
      return super.changerPass();
    } finally {
      _$AuthTechStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passVisib: ${passVisib},
pass: ${pass},
secondpass: ${secondpass},
name: ${name},
surname: ${surname},
email: ${email},
balance: ${balance},
balanceAddition: ${balanceAddition},
totalprice: ${totalprice},
enterPass: ${enterPass},
enterEmail: ${enterEmail},
isUser: ${isUser},
usersCart: ${usersCart}
    ''';
  }
}
