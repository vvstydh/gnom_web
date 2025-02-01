import 'package:flutter/material.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';

class AlertAdressEditing extends StatelessWidget {
  const AlertAdressEditing(
      {super.key, required this.userData, required this.address});
  final UserData userData;
  final String address;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      content: Text(
          'Текущий адресс: $address',
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      actions: [
       
        TextField(
          controller: userData.adress,
          maxLength: 30,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Адресс доставки (город дом квартира)',
            hintStyle: TextStyle(fontFamily: 'Nekst', color: Colors.white),
          ),
        ),
        TextButton(
            onPressed: () {
              if (userData.adress.text.isEmpty || userData.adress.text == ' ') {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Адресс недобавлен!',
                        ));
              } else {
                userData.modifyAddress(userData.addressList.indexOf(address),
                    userData.adress.text);
                userData.adress.clear();
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Адресс успешно добавлен!',
                        ));
              }
            },
            child: const Text(
              'Добавить',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
