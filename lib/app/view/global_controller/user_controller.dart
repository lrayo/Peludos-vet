
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/view/pages/chat/chat_state.dart';

class UserController extends StateNotifier<ChatState> {
  UserController(super.initialState);

  submit() {
    state = state.copyWith(
      name: '',
      weight: '',
      breed: '',
      color: '',
      urlImage: '',
      termsOK: false,
    );
  }
  
}