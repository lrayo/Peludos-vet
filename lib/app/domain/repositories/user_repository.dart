

import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';

abstract class UserRepository {
  Future<void> updateUserData(
    String userId, 
    Map<String, dynamic> data
    ); 

  Future<UserResponse> addPets(
    String userId, PetUpData petData
    );  
}
