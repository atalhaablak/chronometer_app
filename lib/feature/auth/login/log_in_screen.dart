import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:chronometer_app/feature/auth/register/sign_up_screen.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
      ),
      body: Padding(
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
              AppTextFormField(
                hintText: "example@example.com",
                keyboardType: TextInputType.emailAddress,
                labelText: "E-posta",
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                hintText: "******",
                labelText: "Parola",
                obscureText: true,
                maxLines: 1,
              ),
              _buildForgotPasswordButton(context),
              SizedBox(height: 40.h),
              _buildLogInButton(context),
              Padding(
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
              ),
              _buildSignUpButton(context),
            ],
          ),
        ),
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

  Widget _buildLogInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: AppButton(
        text: "Giriş Yap",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
        },
        backgroundColor: context.lightPurple, // context.deepPurple
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
            onTap: () {},
            child: Text(
              "Şifremi unuttum",
              style: context.px11w400.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAuthenticationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          text: "Facebook",
          onPressed: () {},
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
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 133, 68, 207),
            buttonWidth: 100.w,
          ),
        ),
      ],
    );
  }
}
