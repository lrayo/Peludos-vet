import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:peludos_pet/app/view/pages/Vaccination/vaccination_page.dart';
import 'package:peludos_pet/app/view/pages/deworming/dewormig_page.dart';
import 'package:peludos_pet/app/view/pages/home/home_page.dart';
import 'package:peludos_pet/app/view/pages/login/login_page.dart';
import 'package:peludos_pet/app/view/pages/medical_history/add_medical_history_page.dart';
import 'package:peludos_pet/app/view/pages/pets/pet_update_page.dart';
import 'package:peludos_pet/app/view/pages/pets/pets_page.dart';
import 'package:peludos_pet/app/view/pages/record/record_page.dart';
import 'package:peludos_pet/app/view/pages/register/register_page.dart';
import 'package:peludos_pet/app/view/pages/reset_password/reset_password_page.dart';
import 'package:peludos_pet/app/view/pages/result/result_page.dart';
import 'package:peludos_pet/app/view/pages/result/result_pdf_page.dart';
import 'package:peludos_pet/app/view/pages/welcome/welcome_page.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.WELCOME: (context) => const Welcome(),
  Routes.HOME: (context) => const Home(),
  Routes.LOGIN: (context) => const Login(),
  Routes.REGISTER: (context) => const Register(),
  Routes.RECORD: (context) => const Record(),
  Routes.RESULT: (context) => const Result(),
  Routes.RESULTPDF: (context) => const ResutlPdf(),
  Routes.RESET_PASSWORD: (context) => const ResetPassword(), 
  Routes.CHAT: (context) => const Pets(),
  Routes.PETS: (context) => const Pets(),
  Routes.PETUPDATE: (context) => const PetUpdate(),
  Routes.VACCINATION: (context) => const Vaccination(),
  Routes.DEWORMING: (context) => const Deworming(),
  Routes.ADD_MEDICAL_HISTORY: (context) => const AddMedicalHistory(),
};