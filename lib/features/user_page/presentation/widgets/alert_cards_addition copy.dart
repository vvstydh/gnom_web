// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';

class AlertCardsAddition extends StatelessWidget {
  const AlertCardsAddition({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      content: const Text(
        'Добавте карту',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      actions: [
        TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          controller: userData.card,
          maxLength: 5,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Банковаская карта',
            hintStyle: TextStyle(fontFamily: 'Nekst', color: Colors.white),
          ),
        ),
        TextButton(
            onPressed: () {
              if (userData.card.text.isEmpty ||
                  userData.card.text == ' ' ||
                  userData.card.text.length != 5) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Карта недобавлена!',
                        ));
              } else {
                userData.addCard(userData.card.text);
                userData.card.clear();
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Карта успешно добавлена!',
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
