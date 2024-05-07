// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/domain/responses/reset_password_response.dart';
import 'package:peludos_pet/app/utils/email_validator.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/progress_dialog.dart';
import 'package:peludos_pet/app/view/pages/reset_password/controller/reset_password_controller.dart';

final restPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
        provider: restPasswordProvider,
        builder: (_, controller) => Scaffold(
              appBar: AppBar(
                title: const Text('Reset Password'),
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15.0),
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustonInputField(
                            label: 'Email',
                            onChanged: controller.onEmailChanged,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                _submit(context);
                              },
                              child: const Text('Send'))
                        ],
                      )),
                ),
              ),
            ));
  }

  void _submit(BuildContext context) async {
    final controller = restPasswordProvider.read;
    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final respose = await controller.submit();
      Navigator.pop(context);
      if (respose == ResetPasswordResponse.ok) {
        Dialogs.alert(context, title: 'GOOD', content: 'Email sent');
      } else {
        String errorMesssage = '';
        switch (respose) {
          case ResetPasswordResponse.NetworkRequestFailed:
            errorMesssage = 'Network Request Failed';
            break;
          case ResetPasswordResponse.UserDisabled:
            errorMesssage = 'User Disabled';
            break;
          case ResetPasswordResponse.UserNotFound:
            errorMesssage = 'User Not Found';
            break;
          case ResetPasswordResponse.tooManyRequests:
            errorMesssage = 'too Many Requests';
            break;
          case ResetPasswordResponse.Unknown:
          default:
            errorMesssage = 'Unknown error';
            break;
        }
        Dialogs.alert(context, title: 'ERROR', content: errorMesssage);
      }
    }
  }
}
