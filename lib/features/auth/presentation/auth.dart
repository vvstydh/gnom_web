import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';

class Auth extends StatelessWidget {
  const Auth({super.key, required this.passCheck});
  final AuthTech passCheck;

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
            height: 390,
            width: 750,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 49, 94),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Вход в систему',
                  style: TextStyle(
                      fontFamily: 'Nekst', fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    passCheck.enterEmail = value;
                    passCheck.doesUserExist(
                        passCheck.enterEmail, passCheck.enterPass);
                  },
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) {
                      passCheck.enterPass = value;
                      passCheck.doesUserExist(
                          passCheck.enterEmail, passCheck.enterPass);
                    },
                    maxLength: 30,
                    obscureText: passCheck.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
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
                    onPressed: () => context.go('/regist'),
                    child: const Text(
                      'Зарегистрироваться',
                      style:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!passCheck.isUser) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Такого аккаунта нет!',
                                  ));
                        } else {
                          passCheck.getUserByEmail(passCheck.enterEmail);
                          context.go('/');
                        }
                      },
                      child: const Text(
                        'Войти',
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
