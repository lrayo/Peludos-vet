import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/sing_up.dart';
import 'package:peludos_pet/app/domain/repositories/sing_up_repository.dart';
import 'package:peludos_pet/app/domain/responses/sing_up_response.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/register/controller/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController) : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _singUpRepository = Get.find<SingUpRepository>();
  


  Future<SingUpResponse> submit() async {
    try {
      // Registrar en Firebase Auth
      final userCredential = await _singUpRepository.register(SingUpData(
        name: state.name,
        email: state.email,
        password: state.password,
        
      ));

      final user = userCredential.user;

      if (user != null) {
        // Actualizar displayName
        await user.updateDisplayName(
           state.name,
        );

        // Guardar información adicional en Firestore
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "phone": state.phone,
          "address": state.address,
        });

        // Configurar usuario en SessionController
        _sessionController.setUser(user);

        return SingUpResponse(null, user); // No error
      } else {
        return SingUpResponse("User creation failed" as SingUpError?, null); // Error al crear usuario
      }
    } catch (e) {
      return SingUpResponse(e.toString() as SingUpError?, null); // Error capturado
    }
  }



  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
  void onPhoneChanged(String text) {
    state = state.copyWith(phone: text);
  }

  void onAddressChanged(String text) {
    state = state.copyWith(address: text);
  }
}
