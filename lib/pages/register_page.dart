import 'package:flutter/material.dart';
import 'package:peludos_pet/widgets/fondo.dart';
import 'package:peludos_pet/widgets/formRegister_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Fondo(),
          Formregister()
        ],
      )
    );
  }
}