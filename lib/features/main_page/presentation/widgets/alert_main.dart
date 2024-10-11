import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertMain extends StatelessWidget {
  const AlertMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      content: const Text(
        'Зарегистрируйся!',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.go('/auth');
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
