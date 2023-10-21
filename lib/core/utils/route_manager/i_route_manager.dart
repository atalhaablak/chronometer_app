import 'package:flutter/material.dart';

abstract class IRouteManager {
  Future<dynamic> page(String routeName, {Object? argument});
  Future<dynamic> pageAndReplace(String routeName, {Object? argument, bool rootNavigator});
  Future<dynamic> pageAndRemoveUntil(String routeName, {Object? argument, RoutePredicate? predicate});
  Future<dynamic> popUntil({RoutePredicate? predicate});
  dynamic back({Object? argument});
  Future<dynamic> maybePop({Object? argument});
}
