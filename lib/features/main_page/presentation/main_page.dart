import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.passCheck});
  final AuthTech passCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
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
                    child: const Text(
                      'Аккаунт',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('image')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('button'))
                        ],
                      ),
                    );
                  })),
          Row(
            children: [
              Container(
                  color: const Color.fromARGB(255, 199, 199, 199),
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
