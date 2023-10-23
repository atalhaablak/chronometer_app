import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:flutter/material.dart';

void showAppAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  String? cancelText,
  String? confirmText,
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) => AppAlertDialog(
      title: title,
      content: content,
      cancelText: cancelText,
      confirmText: confirmText,
      onCancel: onCancel,
      onConfirm: onConfirm,
    ),
  );
}

class AppAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final Function()? onCancel;
  final Function()? onConfirm;
  const AppAlertDialog({
    super.key,
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "Kaydı Sil", style: context.px16w600.copyWith(color: context.deepPurple)),
      content: Text(content ?? "Kaydı silmek istediğinize emin misiniz?", style: context.px16w400),
      actions: [
        TextButton(
          onPressed: () async => onCancel ?? () => Go.to.maybePop(),
          child: Text(cancelText ?? "İptal", style: context.px16w400),
        ),
        TextButton(
          onPressed: () async => onConfirm ?? () => Go.to.maybePop(),
          child: Text(confirmText ?? "Sil", style: context.px16w400),
        ),
      ],
    );
  }
}
