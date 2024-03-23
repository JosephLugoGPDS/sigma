import 'package:flutter/material.dart';
import 'package:sigma/view/cita/cita_view.dart';
import 'package:sigma/view/login/login_view.dart';
import 'package:sigma/view/menu/menu_view.dart';
import 'package:sigma/view/profile/profile_view.dart';
import 'package:sigma/view/splash/splash_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigma App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/menu': (context) => const MenuView(),
        '/profile': (context) => const ProfileView(),
        '/citas': (context) => const CitasView(),
      },
    );
  }
}
