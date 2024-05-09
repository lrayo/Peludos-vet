
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/view/pages/pets/pets_state.dart';


class UserController extends StateNotifier<PetsState> {
  UserController(super.initialState);

  submit() {
  
    state = state.copyWith(
      petId: '',
      name: '',
      weight: '',
      breed: '',
      color: '',
      urlImage: '',
      termsOK: false,
    );
  }
  
}