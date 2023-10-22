import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    init();
  }

  void init() {}

  bool isLoading = false;

  // kullanılmıyor
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void refreshView() {
    notifyListeners();
  }
}
