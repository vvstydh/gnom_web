import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.passCheck});
  final AuthTech passCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color.fromARGB(255, 35, 27, 144),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ДОМ ГНОМА',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 49, 94),
                  ),
                ),
                TextButton(
                    onPressed: () => context.go('/auth'),
                    child: Text(
                      passCheck.email == null ? 'Аккаунт' : passCheck.email,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color.fromARGB(255, 35, 27, 144),
              height: 60,
            ),
          ),
          Row(
            children: [
              SizedBox(
                  height: 70,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Контакты',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 240, 49, 94),
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
