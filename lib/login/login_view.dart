import 'package:flutter/material.dart';
import 'package:login_test/login/login_view_model.dart';
import 'package:login_test/routers.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();

    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _loginViewModel.userNameController,
              decoration: const InputDecoration(hintText: "User Name"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _loginViewModel.passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _loginViewModel.subject.listen((value) {
                    if (value) {
                      Navigator.of(context)
                          .pushReplacementNamed(OnGenerateRoutes.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("UserName or Passowrd Invalid"),
                      ));
                    }
                  });
                  _loginViewModel.doLogin();
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
