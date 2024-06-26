import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/pages/welcome/widgets/fondo.dart';
import 'package:peludos_pet/app/view/pages/register/widget/form_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        Fondo(),
        FormLogin(indice: 0)
      ],
    ));
  }
}
