import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/auth/login/log_in_screen.dart';
import 'package:chronometer_app/feature/history/view/history_screen.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> init() async {
    await _initiateApp();
  }

  Future<void> _initiateApp() async {
    isLoading = true;
    bool isLogin = false;
    await Future.delayed(const Duration(seconds: 2)); // Login kontrol işlemleri gelecek
    isLoading = false;
    // Login işlemi başarılı ise
    if (isLogin) {
      Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const HistoryScreen()), (predicate) => false);
    } else {
      Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const LogInScreen()), (predicate) => false);
    }
  }
}
