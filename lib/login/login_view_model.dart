import 'package:flutter/material.dart';
import 'package:login_test/home/database.dart';
import 'package:login_test/login/login_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  LoginViewModel();

  final DataBase dataBase = DataBase();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PublishSubject<bool> subject = PublishSubject<bool>();

  final String userName = "Sam@199";
  final String password = "Abc@1234";

  void doLogin() {
    if (userNameController.text != userName &&
        passwordController.text != password) {
      subject.add(false);
      return;
    }
    dataBase.saveUsername(LoginModel(username: userNameController.text));
    subject.add(true);
  }
}
