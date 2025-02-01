import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cart.g.dart';

class Cart = CartStore with _$Cart;

abstract class CartStore with Store {
  var supabase = Supabase.instance.client;

  Future<bool> addToCart(
      String? uid, String path, String name, String price) async {
    final response = await supabase
        .from('cart')
        .select()
        .eq('name', name)
        .eq('UID', uid.toString());

    final existingItem = response.isNotEmpty ? response[0] : null;

    if (existingItem == null) {
      await supabase.from('cart').insert({
        'path': path,
        'name': name,
        'price': price,
        'UID': uid,
        'count': '1'
      });
      return true;
    } else {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCartItems(String userId) async {
    final response = await supabase.from('cart').select('*').eq('UID', userId);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> deleteCartItem(String name) async {
    await supabase.from('cart').delete().eq('name', name);
  }

  Future<void> clearCart(String uid) async {
    await supabase.from('cart').delete().eq('UID', uid);
  }

  Future<void> plusItem(String name, String count) async {
    final addition = 1 + int.parse(count);
    await supabase
        .from('cart')
        .update({'count': addition.toString()}).eq('name', name);
  }

  Future<bool> minusItem(String name, String count) async {
    if (count != '1') {
      final addition = int.parse(count) - 1;
      await supabase
          .from('cart')
          .update({'count': addition.toString()}).eq('name', name);
      return true;
    } else {
      return false;
    }
  }
}
