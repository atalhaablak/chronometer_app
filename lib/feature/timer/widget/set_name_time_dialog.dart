import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field.dart';
import 'package:chronometer_app/feature/timer/viewmodel/timer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetNameTimeDialog extends StatelessWidget {
  const SetNameTimeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  Widget _buildDialog() {
    return Consumer<TimerViewModel>(
      builder: (context, viewModel, child) {
        return AlertDialog(
          title: Text("Kaydet", style: context.px16w600),
          content: _buildInputNameFields(context, viewModel),
          actions: [
            _buildSaveNameButton(viewModel, context),
          ],
        );
      },
    );
  }

  Widget _buildInputNameFields(BuildContext context, TimerViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Lütfen kayıt adını giriniz", style: context.px16w400),
        const SizedBox(height: 20),
        AppTextFormField(
          hintText: "Kayıt adı*",
          controller: viewModel.nameController,
          onChanged: (value) => viewModel.nameControllerChanged(value),
          errorState: viewModel.nameController.text.isEmpty,
          validator: (value) {
            if (value!.isEmpty) {
              return "Bu alan zorunludur";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSaveNameButton(TimerViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          text: "Kaydet",
          onPressed: () => viewModel.saveTime(context),
          backgroundColor: viewModel.isActiveSaveNameButton ? context.deepPurple : context.lightPurple,
        ),
      ],
    );
  }

  static void showSetNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SetNameTimeDialog(),
    );
  }
}
