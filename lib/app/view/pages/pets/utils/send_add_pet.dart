import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/progress_dialog.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import '../pets_page.dart';

Future<void> sendAddPet(BuildContext context) async{
  final controller = petsprovider.read;
  final isvalid = controller.formKey.currentState!.validate();

  if (isvalid) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {

    }else {
    router.pushNamedAndRemoveUntil(Routes.HOME);
    
  }
  } else {
    Dialogs.alert(context, title: 'ERROR', content: 'Invalid Fields');
    
  }
}
