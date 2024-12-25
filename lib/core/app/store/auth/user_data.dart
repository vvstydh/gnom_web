import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_gnom/core/app/store/cart/cart.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_gnom/core/app/store/whaitlist/whaitlist.dart';

part 'user_data.g.dart';

class UserData = UserDataStore with _$UserData;

abstract class UserDataStore with Store {
  @observable
  var login = TextEditingController();

  @observable
  var password = TextEditingController();

  @observable
  var checkPassword = TextEditingController();

  @observable
  var name = TextEditingController();

  @observable
  var surname = TextEditingController();

  @observable
  var adress = TextEditingController();

  @observable
  var card = TextEditingController();

  @observable
  var newEmail = TextEditingController();

  @observable
  var oldPassword = TextEditingController();

  @observable
  var newPassword = TextEditingController();

  @observable
  var newName = TextEditingController();

  @observable
  var newSurname = TextEditingController();

  @observable
  String newAvatar = 'avatar${1}.JPG';

  @observable
  var avatarIndex = 1;

  // ignore: avoid_init_to_null
  User? user = null;

  @observable
  // ignore: avoid_init_to_null
  var userData = null;

  var supabase = Supabase.instance.client;

  @observable
  ObservableList<Map<String, dynamic>> cartItems =
      ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> whaitlistItems =
      ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<String> addressList = ObservableList<String>();

  @observable
  ObservableList<String> cardList = ObservableList<String>();

  @observable
  ObservableList<Map<String, dynamic>> orders =
      ObservableList<Map<String, dynamic>>();

  @observable
  int totalprice = 0;

  @observable
  bool passVisib = true;

  @observable
  int balance = 0;

  @observable
  ObservableList<String> usersCart = ObservableList<String>();

  @observable
  ObservableList<String> unRegisteredUserCart = ObservableList<String>();

  @observable
  List<String> imagePath = [
    'assets/images/gnoms/gnom1.jpeg',
    'assets/images/gnoms/gnom2.jpeg',
    'assets/images/gnoms/gnom3.jpeg',
    'assets/images/gnoms/gnom4.jpeg',
    'assets/images/gnoms/gnom5.jpeg',
    'assets/images/gnoms/gnom6.jpeg',
    'assets/images/gnoms/gnom7.jpeg',
    'assets/images/gnoms/gnom8.jpeg',
    'assets/images/gnoms/gnom9.jpeg',
    'assets/images/gnoms/gnom10.png',
    'assets/images/gnoms/gnom11.png'
  ];

  @observable
  List<String> namePath = [
    'Гном Лёха',
    'Гномик',
    'Синий гном',
    'Гном Захар',
    'Гном военный',
    'Гном мем',
    'Гном пляжный',
    'Серьезный гном',
    'Гном кайфа',
    'Джульетта',
    'Гномео'
  ];

  @observable
  List<String> pricePath = [
    '50 ',
    '300',
    '600',
    '1000',
    '200',
    '100',
    '300',
    '400',
    '600',
    '750',
    '750'
  ];

  @action
  void changerPass() {
    passVisib = !passVisib;
  }

  void userCheck() {
    user = supabase.auth.currentUser;
  }

  Future<void> signIn() async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: login.text,
        password: password.text,
      );
      if (res.user != null) {
        user = res.user;
        getUserData();
        getCart();
        loadAdresses();
        fetchOrderHistory(user!.id);
        getWhaitlist();
        clear();
      } else {
        throw Exception('Пользователь не найден');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getUserData() async {
    userData =
        await supabase.from('userdata').select().eq('uid', user!.id).single();
    print(userData);
  }

  Future<void> getCart() async {
    cartItems.clear();
    cartItems.addAll(await Cart().fetchCartItems(user!.id));
    countPrice();
    print(cartItems);
  }

  Future<void> getWhaitlist() async {
    whaitlistItems.clear();
    whaitlistItems.addAll(await Whaitlist().fetchWhaitlistItems(user!.id));
    print(whaitlistItems);
  }

  Future<void> signUp() async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: login.text,
        password: password.text,
      );

      if (res.user != null) {
        await signIn();
        await supabase.from('userdata').insert({
          'name': name.text,
          'surname': surname.text,
          'uid': res.user!.id,
        });
        clear();
      } else {
        throw Exception('Failed to create user');
      }
    } catch (error) {
      print('Error during sign up: $error');
      rethrow;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    user = null;
    userData = null;
    cartItems.clear();
    whaitlistItems.clear();
  }

  Future<void> changeEmail(String newEmail) async {
    try {
      final user = supabase.auth.currentUser;
      if (user != null) {
        await supabase.auth.updateUser(
          UserAttributes(
            email: newEmail,
            data: {'email_change_suppress_notification': true},
          ),
        );
        print('Email updated successfully');
      } else {
        throw Exception('User not authenticated');
      }
    } catch (error) {
      print('Failed to update email: $error');
    }
  }

  Future<void> changePassword(String newP) async {
    try {
      final user = supabase.auth.currentUser;
      if (user != null) {
        await supabase.auth.updateUser(
          UserAttributes(
            password: newP,
          ),
        );
      } else {
        throw Exception('User not authenticated');
      }
      // ignore: empty_catches
    } catch (error) {}
    oldPassword.clear();
    newPassword.clear();
  }

  void countPrice() {
    totalprice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      final item = cartItems[i];
      totalprice += int.parse(item['price'].toString()) *
          int.parse(item['count'].toString());
    }
  }

  void clear() {
    totalprice = 0;
    balance = 0;
    usersCart.clear();
    login.clear();
    password.clear();
    checkPassword.clear();
  }

  Future<void> addAdress(String address) async {
    addressList.add(address);
    await updateAdressesInDatabase();
    print(addressList);
  }

  Future<void> modifyAddress(int index, String newAddress) async {
    if (index >= 0 && index < addressList.length) {
      addressList[index] = newAddress;
      await updateAdressesInDatabase();
      print(addressList);
    } else {
      print('Invalid index');
    }
  }

  Future<void> deleteAddress(int index) async {
    if (index >= 0 && index < addressList.length) {
      addressList.removeAt(index);
      await updateAdressesInDatabase();
      print(addressList);
    } else {
      print('Invalid index');
    }
  }

  Future<void> loadAdresses() async {
    addressList.clear();
    final response =
        await supabase.from('userdata').select().eq('uid', user!.id).single();
    final userData = response;
    if (userData['adresses'] != null) {
      addressList.addAll(userData['adresses'].split(',').toList());
    }
    print(addressList);
  }

  Future<void> updateAdressesInDatabase() async {
    String adresses = addressList.join(',');
    await supabase
        .from('userdata')
        .update({'adresses': adresses}).eq('uid', user!.id);
  }

  Future<void> addCard(String card) async {
    cardList.add(card);
    await updateCardsInDatabase();
    print(cardList);
  }

  Future<void> modifyCard(int index, String newCard) async {
    if (index >= 0 && index < cardList.length) {
      cardList[index] = newCard;
      await updateCardsInDatabase();
      print(cardList);
    } else {
      print('Invalid index');
    }
  }

  Future<void> deleteCard(int index) async {
    if (index >= 0 && index < cardList.length) {
      cardList.removeAt(index);
      await updateCardsInDatabase();
      print(cardList);
    } else {
      print('Invalid index');
    }
  }

  Future<void> loadCards() async {
    cardList.clear();
    final response =
        await supabase.from('userdata').select().eq('uid', user!.id).single();
    final userData = response;
    if (userData['cards'] != null) {
      cardList.addAll(userData['cards'].split(',').toList());
    }
    print(cardList);
  }

  Future<void> updateCardsInDatabase() async {
    String cards = cardList.join(',');
    await supabase
        .from('userdata')
        .update({'cards': cards}).eq('uid', user!.id);
  }

  Future<void> changeName(String newName) async {
    try {
      await supabase
          .from('userdata')
          .update({'name': newName}).eq('uid', user!.id);
      await getUserData();
      this.newName.clear();
    } catch (error) {
      print('Failed to update name: $error');
    }
  }

  Future<void> changeSurname(String newSurname) async {
    try {
      await supabase
          .from('userdata')
          .update({'surname': newSurname}).eq('uid', user!.id);
      await getUserData();
      this.newSurname.clear();
    } catch (error) {
      print('Failed to update surname: $error');
    }
  }

  Future<void> uploadAvatar(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final fileExt = filePath.split('.').last;
    final fileName = '${user!.id}.$fileExt';

    await supabase.storage.from('avatars').uploadBinary(fileName, bytes);
    final imageUrl = supabase.storage.from('avatars').getPublicUrl(fileName);

    await supabase.auth.updateUser(
      UserAttributes(
        data: {'avatar_url': imageUrl},
      ),
    );
  }

  Future<void> placeOrder(String paymentMethod, String? address) async {
    if (address == null || address.isEmpty) {
      throw Exception('Address cannot be null or empty');
    }

    if (cartItems.isEmpty) {
    } else {
      final orderDetails = {
        'user_id': user!.id,
        'items': cartItems.map((item) => item['name']).toList(),
        'total_price': totalprice,
        'payment_method': paymentMethod,
        'address': address,
        'order_date': DateTime.now().toIso8601String(),
      };

      await supabase.from('orders').insert(orderDetails);
      final cart = Cart();
      await cart.clearCart(user!.id.toString());
      cartItems.clear();
      countPrice();
      fetchOrderHistory(user!.id.toString());
    }
  }

  Future<void> fetchOrderHistory(String userId) async {
    final response =
        await supabase.from('orders').select('*').eq('user_id', userId);
    orders.addAll(List<Map<String, dynamic>>.from(response));
    print(orders);
  }

  Future<void> sendOrderConfirmationEmail(String email) async {
    final String apiKey = 'c5ef7e42740bc594be62e9feea511fcb-2e68d0fb-92fdc4c5'; // Replace with your Mailgun API key
    final String domain = 'sandboxbe96a1e711954866bfc3803d82b42af8.mailgun.org'; // Replace with your Mailgun domain
    final String fromEmail = 'budkodanila50@gmail.com'; // Replace with your verified sender email

    final url = Uri.parse('https://api.mailgun.net/v3/$domain/messages');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('api:$apiKey')),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'from': fromEmail,
        'to': email,
        'subject': 'Order Confirmation',
        'text': 'Your order is being processed. Thank you for your purchase!',
      },
    );

    if (response.statusCode == 200) {
      print('Email sent to $email');
    } else {
      print('Failed to send email: ${response.body}');
    }
  }

// Basic Authentication helper
}
