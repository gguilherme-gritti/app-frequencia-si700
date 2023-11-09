class LoginData {
  String email;
  String password;

  LoginData({required this.email, required this.password});

  bool validForm(LoginData dataLogin) {
    if (dataLogin.email.isEmpty) {
      return false;
    }

    if (dataLogin.password.isEmpty) {
      return false;
    }

    return true;
  }
}
