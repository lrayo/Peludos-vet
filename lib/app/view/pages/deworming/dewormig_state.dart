// ignore: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dewormig_state.freezed.dart';

@freezed
class DewormigState with _$DewormigState{
  
  factory DewormigState({
    @Default('') String nameDeworming,
    required DateTime dewormingDate,

    
    @Default(false) bool termsOK,
    }) = _DewormigState;
  static DewormigState get initialState => DewormigState( dewormingDate: DateTime.now());

}