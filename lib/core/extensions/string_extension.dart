extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }

  bool isEmail() {
    String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(emailPattern).hasMatch(getValueOrDefault);
  }

  bool isPassword() {
    String passwordPattern = r'^(?=.*[0-9])(?=.*[A-Za-z])(?=.*[!@#$%^&*()-_+=<>?]).{4,}$';
    return RegExp(passwordPattern).hasMatch(getValueOrDefault);
  }
}
