import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepositoryImpl(this._firebaseFirestore);

  @override
  Future<UserResponse> updateUserData(
      String userId, Map<String, dynamic> data) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).set(data);
      return UserResponse(null, 'user updated');
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<UserResponse> addPets(
      String userId, PetUpData petData) async {
    try {
      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": FieldValue.arrayUnion([petData.toJson()]), // Agregar mascotas al array
      });
      return UserResponse( null,  'Pet added');
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    } 
  }
}