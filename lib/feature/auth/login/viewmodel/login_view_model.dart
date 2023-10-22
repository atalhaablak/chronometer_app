import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/view/history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  @override
  Future<void> init() async {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isEmail => emailController.text.isEmail();
  bool get isPassword => passwordController.text.isPassword();
  bool get isFormValid => isEmail && isPassword;
  bool showPassword = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    isLoading = false;
  }

  Future<void> signIn() async {
    isLoading = true;
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
            MaterialPageRoute(builder: (context) => const HistoryScreen()), (route) => false);
      }
    } on FirebaseAuthException {
      showAboutDialog(
          context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, children: [const Text("Lütfen Bilgilerinizi Kontrol Ediniz.")]);
    }
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
