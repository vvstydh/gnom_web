import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/core/app/store/cart/cart.dart';
import 'package:web_gnom/core/app/store/whaitlist/whaitlist.dart';
import 'package:web_gnom/features/main_page/presentation/widgets/list_item.dart';

class MainPage extends StatelessWidget {
  final UserData userData;
  final Cart cart;
  final Whaitlist whaitlist;

  const MainPage({
    required this.userData,
    required this.cart,
    required this.whaitlist,
    super.key,
  });

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
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          userData.getCart();
                          context.go('/whaitlist');
                        },
                        icon: const Icon(
                          size: 30,
                          color: Colors.white,
                          Icons.star_rounded,
                        )),
                    IconButton(
                        onPressed: () {
                          userData.getCart();
                          context.go('/cart');
                        },
                        icon: const Icon(
                          size: 30,
                          color: Colors.white,
                          Icons.shopping_cart_rounded,
                        )),
                    TextButton(
                        onPressed: () {
                          if (userData.user != null) {
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
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: userData.imagePath.length,
                  itemBuilder: (context, index) {
                    return ListItem(
                      path: userData.imagePath[index],
                      name: userData.namePath[index],
                      price: userData.pricePath[index],
                      userData: userData,
                      icon: Icons.shopping_cart_rounded,
                      iconWhaitlist: Icons.favorite_border_rounded,
                      onClickWhaitlist: () async {
                        if (userData.user != null) {
                          final isInWhaitlist = await whaitlist.addToWhaitlist(
                            userData.user?.id,
                            userData.imagePath[index],
                            userData.namePath[index],
                            userData.pricePath[index],
                          );
                          if (isInWhaitlist) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Товар добавлен в желаемое')));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Товар уже есть в желаемом')));
                          }
                          userData.getWhaitlist();
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Войдите в аккаунт')));
                        }
                      },
                      onClick: () async {
                        if (userData.user != null) {
                          final isInCart = await cart.addToCart(
                            userData.user?.id,
                            userData.imagePath[index],
                            userData.namePath[index],
                            userData.pricePath[index],
                          );
                          if (isInCart) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Товар добавлен в корзину')));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Товар уже есть в корзине')));
                          }
                          userData.getCart();
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Войдите в аккаунт')));
                        }
                      },
                    );
                  })),
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
