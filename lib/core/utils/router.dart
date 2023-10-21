import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/feature/auth/login/log_in_screen.dart';
import 'package:chronometer_app/feature/auth/register/sign_up_screen.dart';
import 'package:chronometer_app/feature/history/history_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case logInPageRoute:
      return MaterialPageRoute(builder: (_) => const LogInScreen());
    case signUpPageRoute:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case historyPageRoute:
      return MaterialPageRoute(builder: (_) => const HistoryScreen()); // TODO: Replace with HomeScreen
    default:
      return MaterialPageRoute(builder: (_) => const LogInScreen());
  }
}
