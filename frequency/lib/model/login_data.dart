class LoginData {
  String ra;
  String password;

  LoginData({required this.ra, required this.password});

  bool validForm(LoginData dataLogin) {
    if (dataLogin.ra.isEmpty || dataLogin.ra.length != 6) {
      return false;
    }

    if (dataLogin.password.isEmpty) {
      return false;
    }

    return true;
  }
}
