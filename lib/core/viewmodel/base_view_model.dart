import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    init();
  }

  void init() {}

  bool isLoading = false;

  // TODO: overlay yapısı kurulacak

  // var isOverLayerLoadingStreamController = StreamController<bool>.broadcast();
  // Stream<bool> get isOverLayerLoadingStream => isOverLayerLoadingStreamController.stream;

  @override
  void dispose() {
    // isOverLayerLoadingStreamController.close();
    super.dispose();
  }

  void refreshView() {
    notifyListeners();
  }

  // TODO: Data durumlarını handle eden yapı buraya gelecek
}
