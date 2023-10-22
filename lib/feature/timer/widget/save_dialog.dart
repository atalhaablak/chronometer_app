import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/feature/timer/widget/set_name_time_dialog.dart';
import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Kaydet"),
      content: const Text("Kaydetmek istediğinize emin misiniz?"),
      actions: [
        TextButton(
          onPressed: () => Go.to.maybePop(),
          child: const Text("Hayır"),
        ),
        TextButton(
          onPressed: () {
            Go.to.maybePop();
            SetNameTimeDialog.showSetNameDialog(context);
          },
          child: const Text("Evet"),
        ),
      ],
    );
  }

  static void showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SaveDialog(),
    );
  }
}
