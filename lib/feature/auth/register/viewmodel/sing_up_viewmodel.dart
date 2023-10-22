import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpViewModel extends BaseViewModel {
  Future<void> init() async {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Pattern denyFirstCharacterZero = RegExp(r'^0+');
  MaskTextInputFormatter phoneMask = MaskTextInputFormatter(mask: '(###) ### ####');

  bool get isEmailValid => emailController.text.isEmail();
  bool get isPasswordValid => passwordController.text.isPassword();
  bool get isPasswordAgainValid => isPasswordValid && passwordController.text == passwordAgainController.text;
  bool get isNameValid => nameController.text.isName();
  bool get isSurnameValid => surnameController.text.isName();
  bool isPhoneValid = false;
  bool get isCountryValid => countryController.text.isName();
  bool get isFormValid => isEmailValid && isPasswordValid && isPasswordAgainValid && isNameValid && isSurnameValid && isPhoneValid && isCountryValid;

  bool showPassword = true;
  bool showPasswordAgain = true;

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    Future.delayed(Duration(seconds: 2));
    // TODO: sign işlemleri ve kontrolleri gelecek
    Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const HistoryScreen()), (route) => false);
    isLoading = false;
  }

  Future<void> signUpWithGoogle() async {
    isLoading = true;
    isLoading = false;
  }

  Future<void> signUpWithFacebook() async {
    isLoading = true;
    isLoading = false;
  }

  void changePasswordVisibility() {
    showPassword = !showPassword;
    refreshView();
  }

  void changePasswordAgainVisibility() {
    showPasswordAgain = !showPasswordAgain;
    refreshView();
  }

  String? validatePhone(String? value) {
    value = value?.decodePhoneFormat();
    if ((value ?? "").isPhoneNumber()) {
      isPhoneValid = true;
      refreshView();
      return null;
    } else {
      isPhoneValid = false;
      refreshView();
      return "Geçerli bir telefon numarası giriniz";
    }
  }
}
