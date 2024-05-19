

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState with _$ResultState {
  
  factory ResultState({
    @Default('') String resultId,
    @Default('') String examName,
    @Default('') String pdfURL,
    required DateTime resultDate,
    

    @Default(false) bool termsOK,
    }) = _ResultState;
  static ResultState get initialState => ResultState( resultDate: DateTime.now());
}