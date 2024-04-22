import 'package:flutter/material.dart';
import 'package:peludos_pet/pages/chat_page.dart';

import 'package:peludos_pet/pages/home_page.dart';
import 'package:peludos_pet/pages/record_evaluation_page.dart';
import 'package:peludos_pet/pages/record_page.dart';
import 'package:peludos_pet/pages/result_pdf_page.dart';
import 'package:peludos_pet/pages/result_page.dart';
import 'package:peludos_pet/pages/welcome_page.dart';
import 'package:peludos_pet/pages/login_page.dart';
import 'package:peludos_pet/pages/register_page.dart';
import 'package:peludos_pet/widgets/page/welcome/body_widget.dart';

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
      initialRoute: '/home',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home':(context) => const Home(),
        '/record':(context) => const Record(),
        '/Evaluation':(context) => const Evaluation(),
        '/result':(context) => const Result(),
        '/resultPdf':(context) => const ResutlPdf(),
        '/body':(context) => const BodyWidget(),
        '/cjat':(context) => const Chat(),
      },
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      },
    );
  }
}