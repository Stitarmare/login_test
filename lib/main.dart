import 'package:flutter/material.dart';
import 'package:login_test/routers.dart';

import 'login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: OnGenerateRoutes.dynamicRoutes,
      initialRoute: OnGenerateRoutes.login,
    );
  }
}
