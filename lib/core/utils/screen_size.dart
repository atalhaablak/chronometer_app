import 'dart:math';

import 'package:chronometer_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  ScreenSize._init();

  factory ScreenSize() {
    return _instance;
  }

  late Size screenSize;

  double get _scaleText => min(_scaleWidth, _scaleHeight);
  double get _scaleWidth => screenSize.width / AppConstants.designDeviceSize.width;
  double get _scaleHeight => screenSize.height / AppConstants.designDeviceSize.height;

  double getHeight(num heightNum) {
    double height = (screenSize.height * heightNum) / AppConstants.designDeviceSize.height;
    return height;
  }

  double getWidth(num widthNum) {
    double width = (screenSize.width * widthNum) / AppConstants.designDeviceSize.width;
    return width;
  }

  double setSp(num fontSize) => fontSize * _scaleText;

  double radius(num r) {
    return r * min((screenSize.width / AppConstants.designDeviceSize.width), (screenSize.height / AppConstants.designDeviceSize.height));
  }
}
