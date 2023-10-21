import 'package:chronometer_app/core/utils/screen_size.dart';

extension NumExtension on num {
  double get h => ScreenSize().getHeight(this);
  double get w => ScreenSize().getWidth(this);

  double get sp => ScreenSize().setSp(this);

  double get r => ScreenSize().radius(this);
}
