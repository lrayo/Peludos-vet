// ignore: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccination_state.freezed.dart';

@freezed
class VaccinationState with _$VaccinationState{
  
  factory VaccinationState({
    @Default('') String nameVaccination,
    @Default('')String lote,
    required DateTime vaccinationDate,
    
    
    @Default(false) bool termsOK,
    }) = _VaccinationState;
  static VaccinationState get initialState => VaccinationState( vaccinationDate: DateTime.now());
}