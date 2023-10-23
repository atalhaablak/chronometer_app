import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

void showAppErrorDialog({
  required BuildContext context,
  String? title,
  String? content,
  String? confirmText,
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) => AppErrorDialog(
      title: title,
      content: content,
      confirmText: confirmText,
      onConfirm: onConfirm,
    ),
  );
}

class AppErrorDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? confirmText;
  final Function()? onConfirm;

  const AppErrorDialog({
    super.key,
    this.title,
    this.content,
    this.confirmText,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "Hata", style: context.px16w600.copyWith(color: context.deepPurple)),
      content: Text(content ?? "Bir hata oluştu. Lütfen daha sonra tekrar deneyiniz.", style: context.px14w400),
      actions: [
        TextButton(
          onPressed: onConfirm ?? () => Navigator.of(context).pop(),
          child: Text(confirmText ?? "Tamam", style: context.px16w400.copyWith(color: context.deepPurple)),
        ),
      ],
    );
  }
}
