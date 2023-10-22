import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  Future<void> init() async {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isEmail => emailController.text.isEmail();
  bool get isPassword => passwordController.text.isPassword();
  bool get isFormValid => isEmail && isPassword;
  bool showPassword = false;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    isLoading = false;
  }

  Future<void> loginWithGoogle() async {
    isLoading = true;
    isLoading = false;
  }

  Future<void> loginWithFacebook() async {
    isLoading = true;
    isLoading = false;
  }

  void emailFieldChanged(String? value) {
    refreshView();
  }

  void changePasswordVisibility() {
    showPassword = !showPassword;
    refreshView();
  }

  void passwordFieldChanged(String? value) {
    refreshView();
  }
}
