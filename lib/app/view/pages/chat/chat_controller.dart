import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/chat/chat_state.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController(super.initialState);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _userRepository = Get.find<UserRepository>();
  
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<UserResponse> submit() {
    return _userRepository.addPets(
        userId,
        PetUpData(
          name: state.name,
          breed: state.breed,
          age: state.age,
          weight: state.weight,
          photo: state.urlImage,
        ));
  }

  void onNamePetChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onWeightChanged(String text) {
    state = state.copyWith(weight: text);
  }

  void onBreedChanged(String text) {
    state = state.copyWith(breed: text);
  }

  void onColorChanged(String text) {
    state = state.copyWith(color: text);
  }

  void onUrlImageChanged(String text) {
    state = state.copyWith(urlImage: text);
  }

  void onAgeChanged(String text) {
    state = state.copyWith(age: text);
  }

  void onTermsOKChanged(bool value) {
    state = state.copyWith(termsOK: value);
  }
}

  // void onVaccinationChanged(DateTime? date) {
  //   state = state.copyWith(vaccination: date);
  // }

  // void onDewormingChanged(DateTime? date) {
  //   state = state.copyWith(deworming: date);
  // }