import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'whaitlist.g.dart';

class Whaitlist = WhaitlistStore with _$Whaitlist;

abstract class WhaitlistStore with Store {
  var supabase = Supabase.instance.client;

  Future<bool> addToWhaitlist(
      String? uid, String path, String name, String price) async {
    final response = await supabase
        .from('whaitlist')
        .select()
        .eq('name', name)
        .eq('UID', uid.toString());

    final existingItem = response.isNotEmpty ? response[0] : null;

    if (existingItem == null) {
      await supabase.from('whaitlist').insert({
        'path': path,
        'name': name,
        'price': price,
        'UID': uid,
      });
      return true;
    } else {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchWhaitlistItems(String userId) async {
    final response =
        await supabase.from('whaitlist').select('*').eq('UID', userId);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> deleteWhaitlistItem(String name) async {
    await supabase.from('whaitlist').delete().eq('name', name);
  }

  Future<void> clearWhaitlist(String uid) async {
    await supabase.from('whaitlist').delete().eq('UID', uid);
  }
}
