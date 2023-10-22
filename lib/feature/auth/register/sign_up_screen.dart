import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/functions/remove_focus.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:chronometer_app/core/ui/widget/we_are_improving_dialog.dart';
import 'package:chronometer_app/feature/auth/register/viewmodel/sing_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => removeFocus(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Kayıt Ol"),
            ),
            body: Consumer<SignUpViewModel>(
              builder: (context, viewModel, child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPageDescription(context),
                        SizedBox(height: 20.h),
                        _buildAuthenticationButtons(context),
                        SizedBox(height: 40.h),
                        _buildNameInputFields(context, viewModel),
                        SizedBox(height: 20.h),
                        _buildEmailInputField(context, viewModel),
                        SizedBox(height: 20.h),
                        _buildPhoneInputField(context, viewModel),
                        SizedBox(height: 20.h),
                        _buildCountryInputField(context, viewModel),
                        SizedBox(height: 20.h),
                        _buildPasswordInputFields(context, viewModel),
                        SizedBox(height: 40.h),
                        _buildSignUpButton(context, viewModel),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageDescription(BuildContext context) {
    return SizedBox(
      height: 87.h,
      child: Column(
        children: [
          const Text(
            "Kayıt Ol",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            "Kayıt olmak için aşağıdaki yöntemlerden birini kullanabilir ve ya eposta adresiniz ile kayıt olabilirsiniz.",
            style: context.px14w400,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthenticationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          text: "Facebook",
          onPressed: () => showWeAreImprovingDialog(context),
          backgroundColor: const Color(0xFF3b5998),
          buttonWidth: 100.w,
        ),
        Text(
          "ya da",
          style: context.px16w600.copyWith(decoration: TextDecoration.underline),
        ),
        SizedBox(
          width: 100.w,
          child: AppButton(
            text: "Google",
            onPressed: () => showWeAreImprovingDialog(context),
            backgroundColor: const Color.fromARGB(255, 133, 68, 207),
            buttonWidth: 100.w,
          ),
        ),
      ],
    );
  }

  Widget _buildNameInputFields(BuildContext context, SignUpViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: "Adınız",
            labelText: "Ad",
            controller: viewmodel.nameController,
            onChanged: (value) => viewmodel.refreshView(),
            validator: (value) => value.isName() ? null : "Geçerli bir ad giriniz",
            maxLines: 1,
          ),
        ),
        Expanded(
          child: Padding(
            padding: REdgeInsets.only(left: 8.0),
            child: AppTextFormField(
              hintText: "Soyadınız",
              labelText: "Soyad",
              controller: viewmodel.surnameController,
              onChanged: (value) => viewmodel.refreshView(),
              validator: (value) => value.isName() ? null : "Geçerli bir soyad giriniz",
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInputField(BuildContext context, SignUpViewModel viewModel) {
    return AppTextFormField(
      hintText: "example@example.com",
      keyboardType: TextInputType.emailAddress,
      labelText: "E-posta",
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[öçşğıüÖÇŞİĞÜ]')),
        LengthLimitingTextInputFormatter(100),
      ],
      controller: viewModel.emailController,
      onChanged: (value) => viewModel.refreshView(),
      validator: (value) => value.isEmail() ? null : "Geçerli bir e-posta adresi giriniz",
      suffixIcon: Visibility(
        visible: viewModel.isEmailValid,
        child: Icon(
          Icons.check_circle,
          color: context.lightPurple,
        ),
      ),
      errorText: viewModel.isEmailValid ? "Geçerli bir e-posta adresi giriniz" : null,
    );
  }

  Widget _buildPhoneInputField(BuildContext context, SignUpViewModel viewModel) {
    return AppTextFormField(
      onChanged: (value) => viewModel.validatePhone(value),
      hintText: "(5XX) XXX XX XX",
      keyboardType: TextInputType.phone,
      labelText: "Telefon Numarası",
      inputFormatters: [
        FilteringTextInputFormatter.deny(viewModel.denyFirstCharacterZero),
        viewModel.phoneMask,
      ],
      controller: viewModel.phoneController,
      validator: (value) => viewModel.isPhoneValid ? null : "Geçerli bir telefon numarası giriniz",
      suffixIcon: Visibility(
        visible: viewModel.isPhoneValid,
        child: Icon(
          Icons.check_circle,
          color: context.lightPurple,
        ),
      ),
    );
  }

  Widget _buildCountryInputField(BuildContext context, SignUpViewModel viewModel) {
    return AppTextFormField(
      hintText: "örn: Türkiye",
      labelText: "Ülke",
      controller: viewModel.countryController,
      onChanged: (value) => viewModel.refreshView(),
      validator: (value) => value.isName() ? null : "Geçerli bir ülke giriniz",
      maxLines: 1,
    );
  }

  Widget _buildPasswordInputFields(BuildContext context, SignUpViewModel viewModel) {
    return Column(
      children: [
        AppTextFormField(
          hintText: "******",
          labelText: "Parola",
          obscureText: !viewModel.showPassword,
          controller: viewModel.passwordController,
          onChanged: (value) => viewModel.refreshView(),
          validator: (value) => value.isPassword() ? null : "Geçerli bir parola giriniz",
          maxLines: 1,
          suffixIcon: IconButton(
            icon: Icon(
              viewModel.showPassword ? Icons.visibility_off : Icons.visibility,
              color: context.lightPurple,
            ),
            onPressed: () => viewModel.changePasswordVisibility(),
          ),
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          hintText: "******",
          labelText: "Parola",
          obscureText: !viewModel.showPasswordAgain,
          controller: viewModel.passwordAgainController,
          onChanged: (value) => viewModel.refreshView(),
          validator: (value) => viewModel.isPasswordAgainValid ? null : "Parolalar eşleşmiyor",
          maxLines: 1,
          suffixIcon: IconButton(
            icon: Icon(
              viewModel.showPasswordAgain ? Icons.visibility_off : Icons.visibility,
              color: context.lightPurple,
            ),
            onPressed: () => viewModel.changePasswordAgainVisibility(),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context, SignUpViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: AppButton(
        text: "Kayıt Ol",
        onPressed: () => viewModel.signUpWithEmailAndPassword(),
        backgroundColor: viewModel.isFormValid ? context.deepPurple : context.lightPurple,
      ),
    );
  }
}
