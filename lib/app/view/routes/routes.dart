// ignore_for_file: constant_identifier_names

abstract class Routes {
  static const WELCOME = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const HOME = '/home';
  static const RECORD = '/record';
  static const RESULT = '/result';
  static const RESULTPDF = '/resultPdf';
  static const CHAT = '/chat';
  static const RESET_PASSWORD = '/reset_password';
  static const PETS = '/pets';
  static const VACCINATION = '/ vaccination';
  static const DEWORMING = '/deworming';
  static const ADD_MEDICAL_HISTORY = '/add_medical_history';
  static const PETUPDATE = '/petupdate';
  static const ADD_RESULT = '/add_result';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const NOT_FOUND = '/not-found';

}

// //routes: {
//         '/': (context) => const Welcome(),
//         '/login': (context) => const Login(),
//         '/register': (context) => const Register(),
//         '/home': (context) => const Home(),
//         '/record': (context) => const Record(),
//         '/Evaluation': (context) => const Evaluation(),
//         '/result': (context) => const Result(),
//         '/resultPdf': (context) => const ResutlPdf(),
//         '/body': (context) => const BodyWidget(),
//         '/chat': (context) => const Chat(),
//       },