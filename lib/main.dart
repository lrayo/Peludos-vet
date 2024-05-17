
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peludos_pet/app/app.dart';
import 'package:peludos_pet/app/inject_dependencies.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck
  );
  injectDependencies();

  runApp(const MyApp());
}


 

