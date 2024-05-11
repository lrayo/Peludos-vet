

import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/inputs/deworming_data.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/inputs/vac_data.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';

abstract class UserRepository {
  Future<void> updateUserData(
    String userId, 
    Map<String, dynamic> data
    ); 

  Future<UserResponse> addPets(
    String userId, PetUpData petData
    );  

  Future<String?> imagePets(
    String userId, XFile image
    );
    
  Future<UserResponse> addVaccination(
    String userId,String petId, VaccinationData vaccinationData  
    );  

  Future<UserResponse> addDeworming(
    String userId,String petId, DewormingData dewormingData
    );  
}
