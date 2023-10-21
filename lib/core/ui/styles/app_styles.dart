import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/custom_utline_input_border.dart';
import 'package:flutter/material.dart';

extension AppStyles on BuildContext {
  static const double inputBorderRadius = 4;

  BoxDecoration get boxDecorationRadius2 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(2.r),
        ),
      );
  BoxDecoration get boxDecorationRadius3 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(3.r),
        ),
      );
  BoxDecoration get boxDecorationRadius4 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
      );
  BoxDecoration get boxDecorationRadius5 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
      );
  BoxDecoration get boxDecorationRadius6 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      );

  BoxDecoration get boxDecorationRadius10 => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      );

  BoxDecoration get boxDecorationWithBorderRadius3 => BoxDecoration(
      color: white,
      borderRadius: BorderRadius.all(
        Radius.circular(3.r),
      ),
      border: Border.all(color: grey));

  BoxDecoration get boxDecorationWithBorderZeroRadius => BoxDecoration(color: white, border: Border.all(color: grey));

  //#region TextField input Borders

  CustomOutlineInputBorder get textFieldEnabledBorder => CustomOutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius.r),
        ),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      );

  CustomOutlineInputBorder get textFieldFocusedBorder => CustomOutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius.r),
        ),
        borderSide: BorderSide(
          width: 1,
          color: black.withOpacity(.2),
          style: BorderStyle.solid,
        ),
      );

  CustomOutlineInputBorder get textFieldDisabledBorder => CustomOutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius.r),
        ),
        borderSide: BorderSide(
          width: 1,
          color: black.withOpacity(.2),
          style: BorderStyle.solid,
        ),
      );

  CustomOutlineInputBorder get textFieldErrorBorder => CustomOutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius.r),
        ),
        borderSide: BorderSide(
          width: 1,
          color: red,
          style: BorderStyle.solid,
        ),
      );

  CustomOutlineInputBorder get textFieldEnabledBorderWithoutRadius => textFieldEnabledBorder.copyWith(borderRadius: BorderRadius.zero);

  CustomOutlineInputBorder get textFieldDisabledBorderWithoutRadius => textFieldDisabledBorder.copyWith(borderRadius: BorderRadius.zero);

  CustomOutlineInputBorder get textFieldErrorBorderWithoutRadius => textFieldErrorBorder.copyWith(borderRadius: BorderRadius.zero);

  CustomOutlineInputBorder get textFieldFocusedBorderWithoutRadius => textFieldFocusedBorder.copyWith(borderRadius: BorderRadius.zero);

  //#endregion TextField input Borders
}
