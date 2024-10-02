import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_gnom/core/app/store/auth.dart/auth.dart';
import 'package:web_gnom/features/auth/presentation/auth.dart';
import 'package:web_gnom/features/main_page/presentation/main_page.dart';
import 'package:web_gnom/features/regist/presentation/pages/regist.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final passCheck = AuthTech();
    final router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(
          passCheck: passCheck,
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
      )
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
