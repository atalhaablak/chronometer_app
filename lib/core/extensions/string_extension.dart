extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }

  bool isEmail() {
    String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(emailPattern).hasMatch(getValueOrDefault);
  }

  bool isPassword() {
    String passwordPattern = r'^(?=.*[0-9])(?=.*[A-Za-z])(?=.*[!@#$%^&*()-_+=<>?]).{4,}$|^(?=.*[0-9])(?=.*[A-Za-z])[!@#$%^&*()-_+=<>?].{4,}$';
    return RegExp(passwordPattern).hasMatch(getValueOrDefault);
  }

  String decodePhoneFormat() {
    RegExp pattern = RegExp(r'[\D]');
    return getValueOrDefault.replaceAll(pattern, "");
  }

  bool isPhoneNumber() {
    String phonePattern = r'(^5[0-9]{9}$)';
    if (getValueOrDefault.length == 11) {
      var newNumber = getValueOrDefault.replaceFirst(getValueOrDefault[0], "");
      return RegExp(phonePattern).hasMatch(newNumber);
    }
    return RegExp(phonePattern).hasMatch(getValueOrDefault);
  }

  bool isName() {
    String namePattern = r'^[a-zA-ZğüşöçıİĞÜŞÖÇ ]+$';
    return RegExp(namePattern).hasMatch(getValueOrDefault);
  }

  bool isPasswordAgain(String password) {
    return getValueOrDefault == password;
  }
}
