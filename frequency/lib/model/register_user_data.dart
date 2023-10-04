class RegisterUserData {
  String ra;
  String email;
  String name;
  String password;
  String confirmPassword = "";

  RegisterUserData(
      {required this.ra,
      required this.email,
      required this.name,
      required this.password});
}
