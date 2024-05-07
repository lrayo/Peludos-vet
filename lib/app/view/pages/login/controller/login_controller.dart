import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';
import 'package:peludos_pet/app/domain/responses/sing_in_response.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = '', _password = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final _authRepository = Get.find<AuthRepository>();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SingInResponse> submit() async{
    final response = await _authRepository.signInWithEmailAndPassword(
      _email, 
      _password
    );

    if(response.error == null){
      _sessionController.setUser(response.user!);
    }

    return response;
  }
}
