import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/domain/responses/sing_up_response.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/progress_dialog.dart';
import 'package:peludos_pet/app/view/pages/register/form_register.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;

  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SingUpError.emailAlreadyInUse:
          content = 'email Already In Use';
          break;
        case SingUpError.weakPassword:
          content = 'weak Password';
          break;
        case SingUpError.NetworkRequestFailed:
          content = 'Network Request Failed';
          break;
        case SingUpError.tooManyRequests:
          content = 'too Many Requests';
          break;
        case SingUpError.unknown:
        default:
          content = 'unknown error';
          break;
      }

      Dialogs.alert(
        // ignore: use_build_context_synchronously
        context,
        title: 'Error',
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(context, title: "Error", content: "Invalid fields");
  }
}
