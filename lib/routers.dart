import 'package:flutter/material.dart';
import 'package:login_test/home/home_view.dart';
import 'package:login_test/login/login_view.dart';

class OnGenerateRoutes {
  static const String login = '/';
  static const String home = 'HomeView';
  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: ((context) => const LoginView()));
      case home:
        return MaterialPageRoute(builder: ((context) => const HomeView()));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
