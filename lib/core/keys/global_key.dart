import 'package:flutter/material.dart';

class GlobalContextKey {
  static final GlobalContextKey instance = GlobalContextKey._();

  GlobalContextKey._() {
    currentNavigatorKey = globalKey;
  }

  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>(debugLabel: "globalKey");

  late GlobalKey<NavigatorState> currentNavigatorKey;

  void changeCurrentNavigatorKey(GlobalKey<NavigatorState> key) {
    currentNavigatorKey = key;
  }
}
