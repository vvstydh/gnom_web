import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';

class Regist extends StatelessWidget {
  const Regist({super.key, required this.registration});
  final UserData registration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      body: Column(
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
                  fontFamily: 'Nekst', fontSize: 100, color: Colors.white),
            ),
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
                  style: TextStyle(
                      fontFamily: 'Nekst', fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: registration.name,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите имя',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: registration.surname,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите фамилию',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: registration.login,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.password,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(registration.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.checkPassword,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Повторите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(registration.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextButton(
                    onPressed: () {
                      registration.clear();
                      context.go('/auth');
                    },
                    child: const Text(
                      'Назад',
                      style:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white),
                    )),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (registration.password.text !=
                            registration.checkPassword.text) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Пароли не совпадают!',
                                  ));
                        } else if (registration.password.text.length < 6 ||
                            registration.checkPassword.text.length < 6) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText:
                                        'Пароль должен быть больше шести символов!',
                                  ));
                        } else if (registration.name.text.isEmpty ||
                            registration.surname.text.isEmpty ||
                            registration.password.text.isEmpty ||
                            registration.checkPassword.text.isEmpty ||
                            registration.login.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Заполни все поля!',
                                  ));
                        } else {
                          try {
                            await registration.signUp();
                            if (registration.user == null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Пользователь существует')));
                            } else {
                              // ignore: use_build_context_synchronously
                              context.go('/');
                            }
                          } catch (error) {
                            // Show error message to user
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Пользователь существует'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
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
    );
  }
}
