import 'package:flutter/material.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';

class AlertUserPage extends StatelessWidget {
  const AlertUserPage({super.key, required this.alertText, required this.userData});
  final String alertText;
  final AuthTech userData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      content: Text(
        alertText,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Нет',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              userData.clearCart();
              Navigator.pop(context);
            },
            child: const Text(
              'Да',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
