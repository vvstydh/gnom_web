import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';

class AlertBalanceAddition extends StatelessWidget {
  const AlertBalanceAddition({super.key, required this.userData});
  final AuthTech userData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      content: const Text(
        'Сколько вы хотите добавить?',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      actions: [
        TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            userData.balanceAddition = int.parse(value);
          },
          maxLength: 30,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Сумма для внесения',
            hintStyle:
                TextStyle(fontFamily: 'Nekst', color: Colors.white),
          ),
        ),
        TextButton(
            onPressed: () {
              userData.addBalance();
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => const AlertReg(
                        alertText: 'Баланс успешно обновлен!',
                      ));
            },
            child: const Text(
              'Добавить',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
