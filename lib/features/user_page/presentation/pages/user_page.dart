import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/features/cart/presentation/widgets/alert_clear_cart.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_adress_addition%20copy%202.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_adress_editing.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_cards_addition%20copy.dart';
import 'package:web_gnom/features/user_page/presentation/widgets/alert_cards_editing%20copy.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 27, 144),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        const Center(
          child: Text(
            'Аккаунт',
            style: TextStyle(
                fontFamily: 'Nekst', fontSize: 35, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            height: 600,
            width: 700,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 49, 94),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                Observer(
                  builder: (_) => SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/avatars/avatar${userData.avatarIndex}.JPG',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    userData.avatarIndex = Random().nextInt(2);
                  },
                  child: const Text(
                    'Изменить аватар',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Имя: ${userData.userData?['name']}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 35, 27, 144),
                              title: const Text(
                                'Изменить имя',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              content: TextField(
                                controller: userData.newName,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Введите новое имя',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Nekst',
                                      color: Colors.white54),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    userData.changeName(userData.newName.text);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Сохранить',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Отмена',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Фамилия: ${userData.userData?['surname']}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 35, 27, 144),
                              title: const Text(
                                'Изменить фамилию',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              content: TextField(
                                controller: userData.newSurname,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Введите новую фамилию',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Nekst',
                                      color: Colors.white54),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    userData.changeSurname(
                                        userData.newSurname.text);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Сохранить',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Отмена',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Почта: ${userData.user?.email}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Nekst',
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 35, 27, 144),
                              title: const Text(
                                'Изменить почту',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              content: TextField(
                                controller: userData.newEmail,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Введите новый адрес почты',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Nekst',
                                      color: Colors.white54),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    userData
                                        .changeEmail(userData.newEmail.text);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 35, 27, 144),
                                        title: const Text(
                                          'Почта изменена, проверьте новую почту для подтверждения',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              userData.signOut();
                                              context.go('/');
                                            },
                                            child: const Text(
                                              'Хорошо',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Сохранить',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Отмена',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                    builder: (_) => ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                          title: const Text(
                            'Изменить пароль',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Nekst',
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: userData.oldPassword,
                                    decoration: const InputDecoration(
                                      hintText: 'Введите старый пароль',
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                    ),
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: userData.newPassword,
                                    decoration: const InputDecoration(
                                      hintText: 'Введите новый пароль',
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                    ),
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      userData.changePassword(
                                          userData.newPassword.text);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Пароль изменен'),
                                        ),
                                      );
                                    },
                                    child: const Text('Сохранить'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                    builder: (_) => ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Карты',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Nekst',
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertCardsAddition(
                                            userData: userData,
                                          ));
                                },
                              ),
                            ],
                          ),
                          children: userData.cardList
                              .map((card) => ListTile(
                                    title: Text(
                                      card,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Nekst',
                                          color: Colors.white),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertCardsEditing(
                                                      userData: userData,
                                                      card: card,
                                                    ));
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertClearCart(
                                                      alertText:
                                                          'Ты уверен. что хочешь удалить карту?',
                                                      onClick: () async {
                                                        await userData
                                                            .deleteCard(userData
                                                                .cardList
                                                                .indexOf(card));
                                                      },
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                    builder: (_) => ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Адреса',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Nekst',
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertAdressAddition(
                                            userData: userData,
                                          ));
                                },
                              ),
                            ],
                          ),
                          children: userData.addressList
                              .map((address) => ListTile(
                                    title: Text(
                                      address,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Nekst',
                                          color: Colors.white),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertAdressEditing(
                                                      userData: userData,
                                                      address: address,
                                                    ));
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertClearCart(
                                                      alertText:
                                                          'Ты уверен. что хочешь удалить адресс?',
                                                      onClick: () async {
                                                        await userData
                                                            .deleteAddress(
                                                                userData
                                                                    .addressList
                                                                    .indexOf(
                                                                        address));
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                // ignore: use_build_context_synchronously
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Адресс удален')));
                                                      },
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'История заказов',
                  style: TextStyle(
                      fontSize: 25, fontFamily: 'Nekst', color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => ListView.builder(
                    shrinkWrap: true, // Important for nested ListView
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: userData.orders.length,
                    itemBuilder: (context, index) {
                      final order = userData.orders[index];
                      return ListTile(
                        title: Text(
                          order['items'].toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nekst',
                              color: Colors.white),
                        ), // Adjust according to your Order model
                        subtitle: Text(
                          order['order_date'].toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nekst',
                              color: Colors.white),
                        ), // Adjust according to your Order model
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        userData.signOut();
                        context.go('/');
                      },
                      child: const Text(
                        'Выйти из аккаунта',
                        style:
                            TextStyle(fontFamily: 'Nekst', color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        )),
        const SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
