// ignore: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pets_state.freezed.dart';

@freezed
class PetsState with _$PetsState{
  
  factory PetsState({
    @Default('') String petId,
    @Default('') String name,
    @Default('') String weight,
    @Default('') String breed,
    @Default('') String color,
    @Default('') String urlImage,
    @Default('') String age,
    @Default(false) bool termsOK,
    }) = _PetsState;
  static PetsState get initialState => PetsState();

}