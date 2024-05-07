import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/utils/email_validator.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/login/controller/login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class FromLogin extends StatelessWidget {
  const FromLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.transparent,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustonInputField(
                    label: 'Email',
                    isPassword: false,
                    inputType: TextInputType.emailAddress,
                    onChanged: controller.onEmailChanged,
                    validator: (text) {
                      return isValidEmail(text!) ? null : 'Invalid email';
                    },
                  ),
                  CustonInputField(
                    label: 'Password',
                    isPassword: true,
                    onChanged: controller.onPasswordChanged,
                    validator: (text) {
                      if (text!.trim().length >= 6) {
                        return null;
                      }
                      return 'Invalid password';
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
