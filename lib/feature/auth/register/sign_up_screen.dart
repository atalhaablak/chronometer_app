import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/text_form_field.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 20.h),
              _buildAuthenticationButtons(context),
              SizedBox(height: 40.h),
              AppTextFormField(
                hintText: " ",
                keyboardType: TextInputType.emailAddress,
                labelText: "E-posta",
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                hintText: " ",
                labelText: "Parola",
                obscureText: true,
                maxLines: 1,
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                hintText: " ",
                labelText: "Parola Tekrar",
                obscureText: true,
                maxLines: 1,
              ),
              SizedBox(height: 40.h),
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
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

  Widget _buildSignUpButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: AppButton(
        text: "Kayıt Ol",
        onPressed: () {},
        backgroundColor: context.lightPurple, // context.deepPurple
      ),
    );
  }
}
