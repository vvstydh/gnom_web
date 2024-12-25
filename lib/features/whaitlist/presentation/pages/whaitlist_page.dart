import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/core/app/store/cart/cart.dart';
import 'package:web_gnom/core/app/store/order_form/order_form_store.dart';
import 'package:web_gnom/core/app/store/whaitlist/whaitlist.dart';
import 'package:web_gnom/features/regist/presentation/widgets/alert_reg.dart';
import 'package:web_gnom/features/cart/presentation/widgets/alert_clear_cart.dart';
import 'package:web_gnom/features/cart/presentation/widgets/cart_list_item.dart';
import 'package:web_gnom/features/cart/presentation/widgets/order_form.dart';
import 'package:web_gnom/features/whaitlist/presentation/widgets/whaitlist_list_item.dart';

class WhaitlistPage extends StatelessWidget {
  const WhaitlistPage(
      {super.key, required this.passCheck, required this.whaitlist});
  final UserData passCheck;
  final Whaitlist whaitlist;

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
                    'Желаемое',
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
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertClearCart(
                                    alertText:
                                        'Ты уверен, что хочешь очистить желаемое?',
                                    onClick: () async {
                                      await whaitlist.clearWhaitlist(
                                          passCheck.user!.id.toString());
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Корзина очищена')));
                                      passCheck.getWhaitlist();
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
                      itemCount: passCheck.whaitlistItems.length,
                      itemBuilder: (context, index) {
                        final item = passCheck.whaitlistItems[index];
                        return WhaitlistListCartItem(
                          path: item['path'].toString(),
                          name: item['name'].toString(),
                          price: item['price'].toString(),
                          userData: passCheck,
                          icon: Icons.cancel_rounded,
                          onClick: () async {
                            await whaitlist
                                .deleteWhaitlistItem(item['name'].toString());
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Товар удален из желаемого')));
                            passCheck.getWhaitlist();
                          },
                        );
                      }))),
          Container(
            color: const Color.fromARGB(255, 199, 199, 199),
            height: 70,
          )
        ],
      ),
    );
  }
}
