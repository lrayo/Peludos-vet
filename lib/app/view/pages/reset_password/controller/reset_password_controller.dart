import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';
import 'package:peludos_pet/app/domain/responses/reset_password_response.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';
  String get email => _email;

  final _authRepository = Get.find<AuthRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<ResetPasswordResponse> submit() async {
    return await _authRepository.sendRestPasswordLink(_email);
  }
}
