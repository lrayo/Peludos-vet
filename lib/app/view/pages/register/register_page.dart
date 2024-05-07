import 'package:flutter/material.dart';
import 'package:peludos_pet/app/widgets/fondo.dart';
import 'package:peludos_pet/app/view/pages/register/widget/form_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Fondo(),
          FormLogin(indice: 1)
        ],
      )
    );
  }
}