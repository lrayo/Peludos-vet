import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/medical_history_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/pages/medical_history/medical_history_state.dart';

class MedicalHistoryController extends StateNotifier<MedicalState> {
  MedicalHistoryController(super.initialState);

  final GlobalKey<FormState> formMedicalKey = GlobalKey<FormState>();

  final UserRepository _userRepository = Get.find<UserRepository>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String? petId;

  Future<UserResponse> submit() {
    return _userRepository.addMedicalHistory(
        userId,
        petId!,
        MedicalHistoryData(
            medicalHistoryDate: state.medicalHistoryDate,
            reasonForConsultation: state.reasonForConsultation,
            description: state.description));
  }

  void setPetId(String id) {
    petId = id; // Asignar el petId
  }

  void onDateChanged(DateTime date) {
    state = state.copyWith(medicalHistoryDate: date);
  }

  void onReasonForonsultationChanged(String value) {
    state = state.copyWith(reasonForConsultation: value);
  }

  void onDescriptionChanged(String value) {
    state = state.copyWith(description: value);
  }
}
