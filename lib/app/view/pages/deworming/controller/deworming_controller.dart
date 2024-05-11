import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/deworming_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/pages/deworming/dewormig_state.dart';

class DewormingController extends StateNotifier<DewormigState> {
  DewormingController(super.initialState);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserRepository _userRepository = Get.find<UserRepository>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String? petId;

  Future<UserResponse> submit() {
    return _userRepository.addDeworming(
        userId,
        petId!,
        DewormingData(
          namedeworming: state.nameDeworming,
          dewormingDate: state.dewormingDate,
        ),
        );
  }
  void setPetId(String id) {
    petId = id; // Asignar el petId
  }
   void onNameDewormingChanged(String text) {
    state = state.copyWith(nameDeworming: text);
  }
  void onDewormingDateChanged(DateTime date) {
    state = state.copyWith(dewormingDate: date);
  }
}
