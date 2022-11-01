import 'package:flutter_test/flutter_test.dart';
import 'package:login_test/login/login_view_model.dart';

void main() {
  group('Test Login Functionality', () {
    LoginViewModel loginModel = LoginViewModel();

    test('Test invalid credential', () {
      loginModel.passwordController.text = "abc@1234";
      loginModel.userNameController.text = "abc1234";
      loginModel.subject.listen(expectAsync1((e) {
        expect(e, false);
      }));

      loginModel.doLogin();
    });

    test('Test valid credential', () {
      loginModel.passwordController.text = "Abc@1234";
      loginModel.userNameController.text = "Sam@199";
      loginModel.subject.listen(expectAsync1((e) {
        expect(e, true);
      }));
      loginModel.doLogin();
    });
  });
}
