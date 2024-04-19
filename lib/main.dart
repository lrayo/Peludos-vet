import 'package:flutter/material.dart';
import 'package:peludos_pet/pages/home_page.dart';
import 'package:peludos_pet/pages/login_page.dart';
import 'package:peludos_pet/pages/register_page.dart';
import 'package:peludos_pet/widgets/form_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peludos Pet´s',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      },
    );
  }
}