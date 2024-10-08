import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 35, 27, 144),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  onPressed: () => context.go('/'),
                  child: const Text(
                    'ДОМ ГНОМА',
                    style: TextStyle(
                        fontFamily: 'Nekst',
                        fontSize: 100,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                    child: Center(
                        child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(30),
                  height: 600,
                  width: 750,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 49, 94),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Аккаунт',
                        style: TextStyle(
                            fontFamily: 'Nekst',
                            fontSize: 35,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: 'Введите фамилию',
                            hintStyle: TextStyle(
                                fontFamily: 'Nekst', color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: 'Введите имя',
                            hintStyle: TextStyle(
                                fontFamily: 'Nekst', color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (value) {},
                        maxLength: 30,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: 'Введите почту',
                            hintStyle: TextStyle(
                                fontFamily: 'Nekst', color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            context.go('/auth');
                          },
                          child: const Text(
                            'Назад',
                            style: TextStyle(
                                fontFamily: 'Nekst', color: Colors.white),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {},
                            child: const Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                fontFamily: 'Nekst',
                                color: Color.fromARGB(255, 240, 49, 94),
                              ),
                            )),
                      )
                    ],
                  ),
                )))
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ), 
          ],
        ));
  }
}
