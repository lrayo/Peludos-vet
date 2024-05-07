import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

class WelcomeController extends SimpleNotifier {
  final SessionController _sessionController;
  final _auth = Get.find<AuthRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  WelcomeController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _auth.user;
    if (user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.WELCOME;
    }
    notify();
  }
}
