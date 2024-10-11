import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.g.dart';

class AuthTech = AuthTechStore with _$AuthTech;

abstract class AuthTechStore with Store {
  @observable
  bool passVisib = true;

  @observable
  String pass = '';

  @observable
  String secondpass = '';

  @observable
  String name = '';

  @observable
  String surname = '';

  @observable
  String email = '';

  @observable
  int balance = 0;

  @observable
  int balanceAddition = 0;

  @observable
  int totalprice = 0;

  @observable
  String enterPass = '';

  @observable
  String enterEmail = '';

  @observable
  bool isUser = false;

  @observable
  ObservableList<String> usersCart = ObservableList<String>();

  @action
  void changerPass() {
    passVisib = !passVisib;
  }

  void auth() async {
    await Supabase.instance.client.from('auth').insert(
        {'pass': pass, 'name': name, 'surname': surname, 'email': email});
    clear();
  }

  void changePassword() async {
    await Supabase.instance.client.from('auth').update({
      'pass': pass,
    }).eq('email', email);
  }

  void deleteAccount() async {
    await Supabase.instance.client.from('auth').delete().eq('email', email);
    clear();
  }

  void clear() {
    pass = '';
    name = '';
    surname = '';
    email = '';
    secondpass = '';
    enterEmail = '';
    enterPass = '';
    isUser = false;
    totalprice = 0;
    balance = 0;
    balanceAddition = 0;
    usersCart.clear();
  }

  @action
  Future<void> doesUserExist(String emailForEnter, String passForEnter) async {
    final response = await Supabase.instance.client
        .from('auth')
        .select()
        .eq('email', emailForEnter)
        .eq('pass', passForEnter)
        .maybeSingle();

    if (response != null) {
      isUser = true;
    } else {
      isUser = false;
    }
  }

  Future<void> getUserByEmail(String mail) async {
    final response = await Supabase.instance.client
        .from('auth')
        .select()
        .eq('email', mail)
        .single();

    final userData = response;

    email = userData['email'];
    name = userData['name'];
    surname = userData['surname'];
    pass = userData['pass'];
    totalprice = int.parse(userData['cartprice']);
    balance = int.parse(userData['balance']);
    fetchCart();
  }

  void addToCart(String path, String name, String price) async {
    usersCart.add(path);
    usersCart.add(name);
    usersCart.add(price);
    totalprice += int.parse(price);
    var cart = usersCart.join(',');
    await Supabase.instance.client
        .from('auth')
        .update({'cart': cart, 'cartprice': totalprice}).eq('email', email);
    fetchCart();
  }

  Future<void> fetchCart() async {
    usersCart.clear();
    final response = await Supabase.instance.client
        .from('auth')
        .select()
        .eq('email', email)
        .single();
    final userData = response;
    usersCart.addAll(userData['cart'].split(',').toList());
  }

  Future<void> deleteCartItem(int index) async {
    usersCart.removeAt(index);
    usersCart.removeAt(index);
    totalprice -= int.parse(usersCart[index]);
    usersCart.removeAt(index);
    var cart = usersCart.join(',');
    await Supabase.instance.client
        .from('auth')
        .update({'cart': cart, 'cartprice': totalprice}).eq('email', email);
    fetchCart();
  }

  Future<void> clearCart() async {
    usersCart.clear();
    totalprice = 0;
    // ignore: avoid_init_to_null
    var cart = null;
    await Supabase.instance.client
        .from('auth')
        .update({'cart': cart, 'cartprice': totalprice}).eq('email', email);
    fetchCart();
    usersCart.clear();
  }

  Future<void> addBalance() async {
    balance += balanceAddition;
    await Supabase.instance.client.from('auth').update({
      'balance': balance,
    }).eq('email', email);
    balanceAddition = 0;
  }

  Future<void> ordering() async {
    balance -= totalprice;
    clearCart();
    await Supabase.instance.client.from('auth').update({
      'balance': balance,
    }).eq('email', email);
  }
}
