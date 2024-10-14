import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_balance_addition.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_user_page.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/cart_list_item.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.userData});
  final AuthTech userData;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Аккаунт',
                          style: TextStyle(
                              fontFamily: 'Nekst',
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Имя: ${userData.name}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Фамилия: ${userData.surname}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Почта: ${userData.email}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Observer(
                            builder: (_) => Text(
                              'Баланс: ${userData.balance}',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Nekst',
                                  color: Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertBalanceAddition(
                                        userData: userData,
                                      ));
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Observer(
                        builder: (_) => TextField(
                          onChanged: (value) {
                            userData.pass = value;
                          },
                          maxLength: 30,
                          obscureText: userData.passVisib,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Сменить пароль',
                              hintStyle: const TextStyle(
                                  fontFamily: 'Nekst', color: Colors.white),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    userData.changerPass();
                                  },
                                  icon: Icon(userData.passVisib
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
                            userData.secondpass = value;
                          },
                          maxLength: 30,
                          obscureText: userData.passVisib,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Повторите пароль',
                              hintStyle: const TextStyle(
                                  fontFamily: 'Nekst', color: Colors.white),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    userData.changerPass();
                                  },
                                  icon: Icon(userData.passVisib
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye))),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (userData.pass != userData.secondpass) {
                                showDialog(
                                    context: context,
                                    builder: (context) => const AlertReg(
                                          alertText: 'Пароли не совпадают!',
                                        ));
                              } else if (userData.pass == '' ||
                                  userData.secondpass == '') {
                                showDialog(
                                    context: context,
                                    builder: (context) => const AlertReg(
                                          alertText: 'Заполни все поля!',
                                        ));
                              } else {
                                userData.changePassword();
                                showDialog(
                                    context: context,
                                    builder: (context) => const AlertReg(
                                          alertText: 'Пароли поменяны!',
                                        ));
                              }
                            },
                            child: const Text(
                              'Сменить пароль',
                              style: TextStyle(
                                fontFamily: 'Nekst',
                                color: Color.fromARGB(255, 240, 49, 94),
                              ),
                            )),
                      ),
                      Expanded(child: Container()),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              userData.clear();
                              context.go('/');
                            },
                            child: const Text(
                              'Выйти из аккаунта',
                              style: TextStyle(
                                  fontFamily: 'Nekst', color: Colors.white),
                            )),
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              userData.deleteAccount();
                              context.go('/');
                            },
                            child: const Text(
                              'Удалить аккаунт',
                              style: TextStyle(
                                  fontFamily: 'Nekst', color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Корзина',
                          style: TextStyle(
                              fontFamily: 'Nekst',
                              fontSize: 50,
                              color: Colors.white),
                        ),
                        Observer(
                          builder: (_) => Text(
                            'Всего товара на: ${userData.totalprice}\$',
                            style: const TextStyle(
                                fontFamily: 'Nekst',
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertUserPage(
                                        alertText:
                                            'Ты уверен. что хочешь отчистить корзину?',
                                        userData: userData,
                                      ));
                            },
                            icon: const Icon(
                              size: 50,
                              Icons.close_rounded,
                              color: Colors.white,
                            ))
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Observer(
                    builder: (_) => userData.usersCart.isNotEmpty
                        ? SizedBox(
                            width: 700,
                            height: 550,
                            child: Observer(
                                builder: (_) => ListView.builder(
                                    itemCount: userData.usersCart.length ~/ 3.0,
                                    itemBuilder: (context, index) {
                                      final baseIndex = index * 3;
                                      return CartListItem(
                                        path: userData.usersCart[baseIndex],
                                        name: userData.usersCart[baseIndex + 1],
                                        price:
                                            userData.usersCart[baseIndex + 2],
                                        userData: userData,
                                        icon: Icons.cancel_rounded,
                                        onClick: () {
                                          if (userData.usersCart.length == 3) {
                                            userData.clearCart();
                                          } else {
                                            userData.deleteCartItem(baseIndex);
                                          }
                                        },
                                      );
                                    })))
                        : const SizedBox()),
                Observer(
                    builder: (_) => userData.usersCart.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 70,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (userData.balance >= userData.totalprice) {
                                    userData.ordering();
                                    showDialog(
                                        context: context,
                                        builder: (context) => const AlertReg(
                                              alertText:
                                                  'Заказ успешно оформлен, ждите, может когда-нибудь придет :(',
                                            ));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => const AlertReg(
                                              alertText:
                                                  'Недостаточно средств!',
                                            ));
                                  }
                                },
                                child: const Text(
                                  'Оформить заказ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Nekst',
                                    color: Color.fromARGB(255, 35, 27, 144),
                                  ),
                                )),
                          )
                        : const SizedBox()),
              ],
            ),
          ],
        ));
  }
}
