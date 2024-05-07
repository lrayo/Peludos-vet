import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peludos_pet/app/app.dart';
import 'package:peludos_pet/app/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependencies();

  runApp(const MyApp());
}

  // final FirebaseFirestore db = FirebaseFirestore.instance;
  // final CollectionReference users = db.collection('VetPeludos');

  // final Map<String, dynamic> data = <String, dynamic>{
  //   'email': 'lrayo@gmail.com',
  //   'name': 'Luis Rayo',
  //   'number phone': '123',
  // };

  // final newRegister = await users.doc('UinsBZwhcFpLKFK0Qj6c').set(data);
  // newRegister;

  // final allcollection = await db.collection("VetPeludos").get();
  // for (var element in allcollection.docs) {
  //   if (kDebugMode) {
  //     print(element.data());
  //   }
  // }

 

