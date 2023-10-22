import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:flutter/material.dart';

void showWeAreImprovingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const WeAreImprovingDialog(),
  );
}

class WeAreImprovingDialog extends StatelessWidget {
  const WeAreImprovingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Geliştirme Aşamasında"),
      content: const Text("Bu özellik geliştirme aşamasındadır. En kısa sürede kullanıma açılacaktır."),
      actions: [
        TextButton(
          onPressed: () => Go.to.maybePop(),
          child: const Text("Tamam"),
        ),
      ],
    );
  }
}
