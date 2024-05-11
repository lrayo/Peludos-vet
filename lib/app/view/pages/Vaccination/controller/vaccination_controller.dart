// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/vac_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/pages/Vaccination/vaccination_state.dart';

class VaccinationController extends StateNotifier<VaccinationState> {
  VaccinationController(super.initialState);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserRepository _userRepository = Get.find<UserRepository>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String? petId; // Inicialmente null, pero se puede asignar después

  

  Future<UserResponse> submit() {
    return _userRepository.addVaccination(
        userId,
        petId!,
        VaccinationData(
          vaccinationDate: state.vaccinationDate,
          lote: state.lote,
          nameVaccination: state.nameVaccination,
        ));
  }

  void setPetId(String id) {
    petId = id; // Asignar el petId
  }

  void onLoteChanged(String text) {
    state = state.copyWith(lote: text);
  }

  void onNameVaccinationChanged(String text) {
    state = state.copyWith(nameVaccination: text);
  }

  void onVaccinationDateChanged(DateTime date) {
    state = state.copyWith(vaccinationDate: date);
  }

  void onTermsOKChanged(bool value) {
    state = state.copyWith(termsOK: value);
  }
}
