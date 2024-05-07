// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/domain/responses/sing_in_response.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/progress_dialog.dart';
import 'package:peludos_pet/app/view/pages/login/from_login.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final respose = await controller.submit();
    router.pop();
    if (respose.error != null) {
      String errorMessage = '';
      switch (respose.error) {
        case SingInError.NetworkRequestFailed:
          errorMessage = 'Network request failed';
          break;
        case SingInError.UserDisabled:
          errorMessage = 'User disabled';
          break;
        case SingInError.UserNotFound:
          errorMessage = 'User not found';
          break;
        case SingInError.WrongPassword:
          errorMessage = 'Wrong password';
          break;
        case SingInError.tooManyRequests:
          errorMessage = 'Too many requests';
          break;
        case SingInError.Unknown:
        default:
          errorMessage = 'Unknown error';
          break;
      }
      Dialogs.alert(context, title: 'ERROR', content: errorMessage);
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
