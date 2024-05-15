// ignore: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_history_state.freezed.dart';

@freezed
class MedicalState with _$MedicalState{
  
  factory MedicalState({
    @Default('') String reasonForConsultation,
    @Default('')String description,
    required DateTime medicalHistoryDate,
    
    
    @Default(false) bool termsOK,
    }) = _MedicalState;
  static MedicalState get initialState => MedicalState( medicalHistoryDate: DateTime.now());
}