import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';
import 'package:web_gnom/core/app/store/cart/cart.dart';
import 'package:web_gnom/core/app/store/gnoms_list/gnoms_list.dart';
import 'package:web_gnom/features/auth/presentation/auth.dart';
import 'package:web_gnom/features/cart/presentation/pages/cart_page.dart';
import 'package:web_gnom/features/main_page/presentation/pages/main_page.dart';
import 'package:web_gnom/features/regist/presentation/pages/regist.dart';
import 'package:web_gnom/features/user_page/presentation/pages/user_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final passCheck = UserData();
    final cart = Cart();
    final gnomList = GnomsList();
    
    passCheck.userCheck();
    if (passCheck.user != null) {
      passCheck.getUserData();
      passCheck.getCart();
      passCheck.loadAdresses();
      passCheck.loadCards();
      passCheck.fetchOrderHistory(passCheck.user!.id.toString());
    }
    final router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(
          userData: passCheck,
          cart: cart,
          gnomList: gnomList,
        ),
      ),
      GoRoute(
        path: '/regist',
        builder: (context, state) => Regist(
          registration: passCheck,
        ),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => Auth(
          authentification: passCheck,
        ),
      ),
      GoRoute(
        path: '/user_page',
        builder: (context, state) => UserPage(
          userData: passCheck,
        ),
      ),
      GoRoute(
          path: '/cart',
          builder: (context, state) => CartPage(
                passCheck: passCheck,
                cart: cart,
              ))
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
