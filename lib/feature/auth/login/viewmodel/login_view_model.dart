import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/ui/widget/show_error_dialog.dart';
import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  @override
  Future<void> init() async {}

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isEmail => emailController.text.isEmail();
  bool get isPassword => passwordController.text.isPassword();
  bool get isFormValid => isEmail && isPassword;
  bool get isUserLogIn => _firebaseAuth.currentUser != null;
  bool showPassword = false;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    isLoading = true;
    isLoading = false;
  }

  Future<void> signIn() async {
    if (isFormValid) {
      isLoading = true;
      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        if (userCredential.user != null) {
          Go.to.pageAndRemoveUntil(historyPageRoute);
        }
      } on FirebaseAuthException catch (e) {
        showAppErrorDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, content: e.code);
      }
      isLoading = false;
    }
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

  void navigateToSignUpScreen(BuildContext context) {
    Go.to.page(signUpPageRoute);
  }
}
