

import 'package:flutter/cupertino.dart';

Future<String?> showInputDialog(BuildContext context, {String? title}) async{

  String? value = '';
  final result = await showCupertinoDialog(
    context: context, 
    builder: (context) => CupertinoAlertDialog(
      title: title!=null ? Text(title) : null,
      content: CupertinoTextField(
        onChanged: (text) => value = text,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context, value),
          isDefaultAction: true,
          child: const Text('Save'),
        ),
        CupertinoDialogAction(         
          onPressed: () => Navigator.pop(context),
          isDestructiveAction: true,
          child: const Text('Cancel'),
        ),
      ],
      )
    );

  if (result != null && result.trim().isEmpty) {
    return null;
  }
  return result;
}