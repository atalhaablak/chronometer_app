import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final ButtonStyle? buttonStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? 100.w,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor ?? context.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
        child: Text(
          text,
          style: context.px14w600.copyWith(color: context.white),
        ),
      ),
    );
  }
}
