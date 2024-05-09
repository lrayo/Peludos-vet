import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  late BuildContext _dialogContext;
  static void show(BuildContext context) {
    showCupertinoModalPopup(
        context: context, builder: (_) => PopScope(
          canPop: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
            ),
          ),
          ));
  }

  void dismiss() {
    Navigator.pop(_dialogContext); // Cerrar el diálogo
  }
}
