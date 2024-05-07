// ignore: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState{
  
  factory ChatState({
    @Default('') String name,
    @Default('') String weight,
    @Default('') String breed,
    @Default('') String color,
    @Default('') String urlImage,
    @Default('') String age,
    @Default(false) bool termsOK,
    }) = _ChatState;
  static ChatState get initialState => ChatState();

}