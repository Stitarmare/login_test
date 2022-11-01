class LoginModel {
  final String username;
  const LoginModel({required this.username});
  Map<String, dynamic> toMap() {
    return {'username': username};
  }
}
