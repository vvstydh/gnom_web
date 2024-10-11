import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/core/app/store/gnoms_list/gnoms_list.dart';
import 'package:web_gnom/features/main_page/presentation/widgets/alert_main.dart';
import 'package:web_gnom/features/main_page/presentation/widgets/list_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.passCheck, required this.gnomList});
  final AuthTech passCheck;
  final GnomsList gnomList;

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
                    fontFamily: 'Nekst',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 49, 94),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (passCheck.isUser) {
                        passCheck.fetchCart();
                        context.go('/user_page');
                      } else {
                        context.go('/auth');
                      }
                    },
                    child: const Text(
                      'Аккаунт',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Nekst',
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              child: Observer(
                  builder: (_) => ListView.builder(
                      itemCount: gnomList.gnomPath.length,
                      itemBuilder: (context, index) {
                        return ListItem(
                          path: gnomList.gnomPath[index],
                          name: gnomList.gnomName[index],
                          price: gnomList.gnomPrice[index],
                          userData: passCheck,
                          icon: Icons.shopping_cart_rounded,
                          onClick: () {
                            if (passCheck.isUser) {
                              passCheck.addToCart(
                                gnomList.gnomPath[index],
                                gnomList.gnomName[index],
                                gnomList.gnomPrice[index],
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => const AlertMain());
                            }
                          },
                        );
                      }))),
          Container(
              color: const Color.fromARGB(255, 199, 199, 199),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Контакты',
                        style: TextStyle(
                          fontFamily: 'Nekst',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 240, 49, 94),
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        '',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 240, 49, 94),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
