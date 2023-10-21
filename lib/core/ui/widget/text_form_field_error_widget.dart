import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldErrorWidget extends StatelessWidget {
  final String text;
  const AppTextFormFieldErrorWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.error,
          size: 14,
        ),
        Expanded(
          child: Padding(
            padding: REdgeInsets.only(top: 7),
            child: Text(
              text,
              style: context.px12w600,
            ),
          ),
        ),
      ],
    );
  }
}
