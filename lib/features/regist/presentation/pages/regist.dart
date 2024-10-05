import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/core/widgets/alert_reg.dart';

class Regist extends StatelessWidget {
  const Regist({super.key, required this.passCheck});
  final AuthTech passCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'ДОМ ГНОМА',
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
          Expanded(
              child: Center(
                  child: Container(
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
                  'Регистрация',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    passCheck.surname = value;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите фамилию',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    passCheck.name = value;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите имя',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    passCheck.email = value;
                  },
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) {
                      passCheck.pass = value;
                    },
                    maxLength: 30,
                    obscureText: passCheck.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              passCheck.changerPass();
                            },
                            icon: Icon(passCheck.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) {
                      passCheck.secondpass = value;
                    },
                    maxLength: 30,
                    obscureText: passCheck.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Повторите пароль',
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              passCheck.changerPass();
                            },
                            icon: Icon(passCheck.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      passCheck.clear();
                      context.go('/auth');
                    },
                    child: const Text(
                      'Назад',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (passCheck.pass != passCheck.secondpass) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Пароли не совпадают!',
                                  ));
                        } else if (passCheck.pass == '' ||
                            passCheck.name == '' ||
                            passCheck.email == '' ||
                            passCheck.surname == '') {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Заполни все поля!',
                                  ));
                        } else {
                          passCheck.auth();
                          context.go('/auth');
                        }
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          color: Color.fromARGB(255, 240, 49, 94),
                        ),
                      )),
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
