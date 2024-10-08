import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_gnom/core/app/store/auth.dart/user_data.dart';

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
  String enterPass = '';

  @observable
  String enterEmail = '';

  @observable
  bool isUser = false;

  @observable
  ObservableList<UserData> userData = ObservableList<UserData>();

  @action
  void changerPass() {
    passVisib = !passVisib;
  }

  void auth() async {
    await Supabase.instance.client.from('auth').insert(
        {'pass': pass, 'name': name, 'surname': surname, 'email': email});
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

  Future<void> userAccData() async {
    final response = await Supabase.instance.client.from('auth').select();
    
    print(response);
  }
}
