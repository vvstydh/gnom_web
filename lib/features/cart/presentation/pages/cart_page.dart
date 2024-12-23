import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/core/app/store/cart/cart.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';
import 'package:web_gnom/features/cart/presentation/widgets/alert_clear_cart.dart';
import 'package:web_gnom/features/cart/presentation/widgets/cart_list_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.passCheck, required this.cart});
  final UserData passCheck;
  final Cart cart;

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
                    'Корзина',
                    style: TextStyle(
                      fontFamily: 'Nekst',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(
                      builder: (_) => Text(
                        'Всего товара на: ${passCheck.totalprice}\$',
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
                              builder: (context) => AlertClearCart(
                                    alertText:
                                        'Ты уверен. что хочешь очистить корзину?',
                                    onClick: () async {
                                      await cart.clearCart(
                                          passCheck.user!.id.toString());
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Корзина очищена')));
                                      passCheck.getCart();
                                    },
                                  ));
                        },
                        icon: const Icon(
                          size: 40,
                          Icons.close_rounded,
                          color: Colors.white,
                        )),
                    TextButton(
                        onPressed: () {
                          if (passCheck.user != null) {
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
              child: Observer(
                  builder: (_) => ListView.builder(
                      itemCount: passCheck.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = passCheck.cartItems[index];
                        return CartListItem(
                          path: item['path'].toString(),
                          name: item['name'].toString(),
                          price: item['price'].toString(),
                          count: item['count'].toString(),
                          userData: passCheck,
                          icon: Icons.cancel_rounded,
                          onClick: () async {
                            await cart.deleteCartItem(item['name'].toString());
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Товар удален из корзины')));
                            passCheck.getCart();
                          },
                          onClickPlus: () async {
                            await cart.plusItem(item['name'], item['count']);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Количество товара увеличено на 1')));
                            passCheck.getCart();
                          },
                          onClickMinus: () async {
                            final minus = await cart.minusItem(
                                item['name'], item['count']);
                            if (minus) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Количество товара уменьшено на 1')));
                              passCheck.getCart();
                            }
                          },
                        );
                      }))),
          Observer(
              builder: (_) => passCheck.usersCart.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              onPressed: () {
                                if (passCheck.balance >= passCheck.totalprice) {
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
                                            alertText: 'Недостаточно средств!',
                                          ));
                                }
                              },
                              child: const Text(
                                'Оформить заказ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Nekst',
                                  color: Colors.white,
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              255, 35, 27, 144),
                                          content: const Text(
                                            'Ваш комментарий',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                          actions: [
                                            TextField(
                                              onChanged: (value) {},
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                    fontFamily: 'Nekst',
                                                    color: Colors.white),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          const AlertReg(
                                                            alertText:
                                                                'Комментарий будет учтен',
                                                          ));
                                                },
                                                child: const Text(
                                                  'Добавить',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ))
                                          ],
                                        ));
                              },
                              child: const Text(
                                'Добавить комментарий к заказу',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Nekst',
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ))
                  : const SizedBox()),
          Container(
              color: const Color.fromARGB(255, 199, 199, 199),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Оформить заказ',
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