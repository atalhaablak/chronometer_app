import 'package:flutter/material.dart';

class GlobalContextKey {
  static final GlobalContextKey instance = GlobalContextKey._();

  GlobalContextKey._();

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>(debugLabel: "globalKey");
  final GlobalKey<NavigatorState> currentNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "currentNavigatorKey");
}
