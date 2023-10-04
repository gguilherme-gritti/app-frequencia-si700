class LoginData {
  String ra;
  String password;
  bool valid = false;

  LoginData({required this.ra, required this.password});

  bool validForm(LoginData dataLogin) {
    print(dataLogin.password);
    if (dataLogin.ra.isEmpty || dataLogin.ra.length != 6) {
      return false;
    }

    if (dataLogin.password.isEmpty) {
      return false;
    }

    return true;
  }
}
