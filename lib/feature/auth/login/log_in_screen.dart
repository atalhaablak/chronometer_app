import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:chronometer_app/core/ui/widget/we_are_improving_dialog.dart';
import 'package:chronometer_app/feature/auth/login/viewmodel/login_view_model.dart';
import 'package:chronometer_app/feature/auth/register/sign_up_screen.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Giriş Yap"),
        ),
        body: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Giriş Yap",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Giriş yapmak için aşağıdaki yöntemlerden birini kullanabilir ve ya eposta adresiniz ile giriş yapabilirsiniz.",
                    style: context.px14w400,
                  ),
                  SizedBox(height: 20.h),
                  _buildAuthenticationButtons(context),
                  SizedBox(height: 40.h),
                  _buildEmailInputField(context, viewModel),
                  SizedBox(height: 20.h),
                  _buildPasswordInputField(context, viewModel),
                  _buildForgotPasswordButton(context),
                  SizedBox(height: 40.h),
                  _buildLogInButton(context, viewModel),
                  _buildDivider(context),
                  _buildSignUpButton(context),
                ],
              ),
            ),
          );
        }),
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

  Widget _buildEmailInputField(BuildContext context, LoginViewModel viewModel) {
    return AppTextFormField(
      hintText: "example@example.com",
      keyboardType: TextInputType.emailAddress,
      labelText: "E-posta",
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[öçşğıüÖÇŞİĞÜ]'))],
      controller: viewModel.emailController,
      onChanged: (value) => viewModel.emailFieldChanged(value),
      validator: (value) => value.isEmail() ? null : "Geçerli bir e-posta adresi giriniz",
      suffixIcon: Visibility(
        visible: viewModel.isEmail,
        child: Icon(
          Icons.check_circle,
          color: context.lightPurple,
        ),
      ),
      errorText: viewModel.isEmail ? "Geçerli bir e-posta adresi giriniz" : null,
    );
  }

  Widget _buildPasswordInputField(BuildContext context, LoginViewModel viewModel) {
    return AppTextFormField(
      hintText: "******",
      labelText: "Parola",
      obscureText: viewModel.showPassword,
      controller: viewModel.passwordController,
      onChanged: (value) => viewModel.passwordFieldChanged(value),
      validator: (value) => value.isPassword() ? null : "Geçerli bir parola giriniz",
      maxLines: 1,
      suffixIcon: IconButton(
        icon: Icon(
          viewModel.showPassword ? Icons.visibility : Icons.visibility_off,
          color: context.lightPurple,
        ),
        onPressed: () => viewModel.changePasswordVisibility(),
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: REdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () => showWeAreImprovingDialog(context), // TODO: Forgot password screen
            child: Text(
              "Şifremi unuttum",
              style: context.px11w400.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogInButton(BuildContext context, LoginViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: AppButton(
        text: "Giriş Yap",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
        },
        backgroundColor: viewModel.isFormValid ? context.deepPurple : context.lightPurple,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: context.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "ya da",
              style: context.px14w400,
            ),
          ),
          Expanded(
            child: Divider(
              color: context.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Hesabınız yok mu? ",
          style: context.px14w400,
          children: [
            TextSpan(
              text: "Kayıt Ol",
              style: context.px14w600.copyWith(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
