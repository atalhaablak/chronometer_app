import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_styles.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends FormField<String> {
  AppTextFormField(
      {Key? key,
      String? Function(String?)? validator,
      void Function(String?)? onChanged,
      bool autofocus = false,
      TextEditingController? controller,
      Color? cursorColor,
      bool enabled = true,
      InputBorder? border,
      InputBorder? enabledBorder,
      InputBorder? errorBorder,
      InputBorder? focusedBorder,
      InputBorder? disabledBorder,
      String? errorText,
      Color? fillColor,
      String? hintText,
      Widget? label,
      TextStyle? labelStyle,
      Widget? prefixIcon,
      Widget? suffix,
      Widget? suffixIcon,
      TextAlignVertical? textAlignVertical,
      bool? obscureText,
      AutovalidateMode? autovalidateMode,
      Function(String)? onFieldSubmitted,
      FocusNode? focusNode,
      List<TextInputFormatter>? inputFormatters,
      TextInputType? keyboardType,
      bool? autoCorrect,
      BoxConstraints? suffixIconConstraints,
      TextStyle? style,
      int? maxLines,
      bool? alignLabelWithHint,
      TextInputAction? textInputAction,
      GestureTapCallback? onTap,
      Color? disabledColor,
      bool hideNativeErrorMessage = true,
      String? labelText,
      int? maxLength,
      EdgeInsetsGeometry? contentPadding,
      TextStyle? hintStyle,
      bool? errorState})
      : super(
          key: key,
          validator: validator,
          enabled: enabled,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
          initialValue: controller != null ? controller.text : '',
          builder: (FormFieldState<String> state) {
            var context = GlobalContextKey.instance.globalKey.currentContext!;
            return Column(
              children: [
                TextFormField(
                  key: key,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  focusNode: focusNode,
                  onFieldSubmitted: onFieldSubmitted,
                  obscureText: obscureText ?? false,
                  obscuringCharacter: '*',
                  onChanged: (value) {
                    state.didChange(value);
                    onChanged?.call(value);
                  },
                  autovalidateMode: autovalidateMode,
                  validator: validator,
                  enabled: enabled,
                  autofocus: autofocus,
                  textAlignVertical: textAlignVertical,
                  inputFormatters: inputFormatters,
                  controller: controller,
                  style: style ?? context.px14w400,
                  autocorrect: autoCorrect ?? false,
                  textInputAction: textInputAction,
                  onTap: onTap,
                  decoration: InputDecoration(
                    hintStyle: hintStyle,
                    contentPadding: contentPadding,
                    errorStyle: hideNativeErrorMessage
                        ? TextStyle(
                            height: 0,
                            color: context.transparent,
                            fontSize: 0,
                          )
                        : context.px12w600,
                    labelText: labelText,
                    floatingLabelStyle: context.px11w400,
                    fillColor: enabled ? fillColor ?? context.textFieldBgColor : disabledColor ?? context.black.withOpacity(0.1),
                    filled: true,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    suffix: suffix,
                    border: border ?? context.textFieldEnabledBorder,
                    enabledBorder: enabledBorder ?? context.textFieldEnabledBorder,
                    focusedBorder: focusedBorder ?? context.textFieldFocusedBorder,
                    errorBorder: errorBorder ?? context.textFieldErrorBorder,
                    disabledBorder: disabledBorder ?? context.textFieldDisabledBorder,
                    focusedErrorBorder: context.textFieldErrorBorder,
                    suffixIconConstraints: suffixIconConstraints,
                    hintText: hintText,
                    label: label,
                    alignLabelWithHint: alignLabelWithHint,
                    labelStyle: labelStyle,
                  ),
                  cursorColor: cursorColor ?? context.deepPurple,
                ),
                if (state.errorText != null) AppTextFormFieldErrorWidget(text: "*${state.errorText.getValueOrDefault}")
              ],
            );
          },
        );
}
