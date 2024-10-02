import 'package:flutter/material.dart';

class AlertReg extends StatelessWidget {
  const AlertReg({super.key, required this.alertText});

  final String alertText;

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
              'Хорошо',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
