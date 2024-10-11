import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_gnom/core/app/store/gnoms_list/gnoms_list.dart';

class GnomDb {
  GnomDb({required this.gnomList});

  final GnomsList gnomList;

  Future<void> fetchGnomsPath() async {
    final response =
        await Supabase.instance.client.from('gnoms').select('path');
    final data = response as List<dynamic>;
    final gnomNames = data.map((gnom) => gnom['path'] as String).toList();
    gnomList.gnomPath.clear();
    gnomList.gnomPath.addAll(gnomNames);
    
  }

  Future<void> fetchGnomsNames() async {
    final response =
        await Supabase.instance.client.from('gnoms').select('name');
    final data = response as List<dynamic>;
    final gnomNames = data.map((gnom) => gnom['name'] as String).toList();
    gnomList.gnomName.clear();
    gnomList.gnomName.addAll(gnomNames);
  }

  Future<void> fetchGnomsPrices() async {
    final response =
        await Supabase.instance.client.from('gnoms').select('price');
    final data = response as List<dynamic>;
    final gnomNames = data.map((gnom) => gnom['price'] as String).toList();
    gnomList.gnomPrice.clear();
    gnomList.gnomPrice.addAll(gnomNames);
  }
}
