import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/core/app/store/gnoms_list/gnoms_list.dart';
import 'package:web_gnom/features/auth/presentation/auth.dart';
import 'package:web_gnom/features/main_page/data/gnom_db.dart';
import 'package:web_gnom/features/main_page/presentation/pages/main_page.dart';
import 'package:web_gnom/features/regist/presentation/pages/regist.dart';
import 'package:web_gnom/features/user_page/presentation/pages/user_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final passCheck = AuthTech();
    final gnomList = GnomsList();
    final gnom = GnomDb(gnomList: gnomList);
    gnom.fetchGnomsPath();
    gnom.fetchGnomsNames();
    gnom.fetchGnomsPrices();
    final router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(
          passCheck: passCheck,
          gnomList: gnomList,
        ),
      ),
      GoRoute(
        path: '/regist',
        builder: (context, state) => Regist(
          passCheck: passCheck,
        ),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => Auth(
          passCheck: passCheck,
        ),
      ),
      GoRoute(
        path: '/user_page',
        builder: (context, state) => UserPage(
          userData: passCheck,
        ),
      )
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
