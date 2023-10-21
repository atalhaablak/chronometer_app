import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/utils/route_manager/i_route_manager.dart';
import 'package:flutter/material.dart';

class Go implements IRouteManager {
  static Go to = Go._init();
  Go._init();

  @override
  Future page(
    String routeName, {
    Object? argument,
  }) async {
    Navigator.of(
      GlobalContextKey.instance.currentNavigatorKey.currentContext!,
    ).pushNamed(routeName, arguments: argument);
  }

  @override
  Future pageAndReplace(
    String routeName, {
    Object? argument,
    bool rootNavigator = false,
  }) async {
    Navigator.of(
      GlobalContextKey.instance.currentNavigatorKey.currentContext!,
    ).pushReplacementNamed(routeName, arguments: argument);
  }

  @override
  Future pageAndRemoveUntil(
    String routeName, {
    Object? argument,
    RoutePredicate? predicate,
  }) async {
    Navigator.of(
      GlobalContextKey.instance.currentNavigatorKey.currentContext!,
    ).pushNamedAndRemoveUntil(routeName, predicate ?? (route) => false, arguments: argument);
  }

  @override
  void back({Object? argument, GlobalKey<NavigatorState>? currentNavigatorKey}) {
    var navigatorKey = currentNavigatorKey ?? GlobalContextKey.instance.currentNavigatorKey;
    if (navigatorKey.currentContext != null) {
      return Navigator.of(navigatorKey.currentContext!).pop(argument);
    }
  }

  @override
  Future maybePop({Object? argument}) async {
    if (GlobalContextKey.instance.currentNavigatorKey.currentContext != null) {
      return Navigator.of(GlobalContextKey.instance.currentNavigatorKey.currentContext!).maybePop(argument);
    }
  }

  @override
  Future popUntil({RoutePredicate? predicate, GlobalKey<NavigatorState>? currentNavigatorKey}) async {
    var navigatorKey = currentNavigatorKey ?? GlobalContextKey.instance.currentNavigatorKey;
    Navigator.of(
      navigatorKey.currentContext!,
    ).popUntil(predicate ?? (route) => route.isFirst);
  }
}
