import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/auth/login/log_in_screen.dart';
import 'package:chronometer_app/feature/auth/login/viewmodel/login_view_model.dart';
import 'package:chronometer_app/feature/history/view/history_screen.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    await _initiateApp();
  }

  Future<void> _initiateApp() async {
    await Future.delayed(const Duration(seconds: 2));
    if (getIt<LoginViewModel>().isUserLogIn) {
      Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const HistoryScreen()), (predicate) => false);
    } else {
      Navigator.pushAndRemoveUntil(GlobalContextKey.instance.currentNavigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const LogInScreen()), (predicate) => false);
    }
  }
}
