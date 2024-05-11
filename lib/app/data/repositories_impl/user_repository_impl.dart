import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/inputs/deworming_data.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/inputs/vac_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage storage;

  UserRepositoryImpl(this._firebaseFirestore, this.storage);

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
  Future<UserResponse> addPets(String userId, PetUpData petData) async {
    try {
      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": FieldValue.arrayUnion(
            [petData.toJson()]), // Agregar mascotas al array
      });
      return UserResponse(null, 'Pet added');
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<String?> imagePets(String userId, XFile image) async {
    try {
      final filePath =
          "pets/$userId/${DateTime.now().toString()}"; // Ruta en Storage
      final ref =
          storage.ref().child(filePath); // Referencia al archivo en Storage

      final uploadTask =
          ref.putFile(File(image.path)); // Sube el archivo a Storage
      await uploadTask.whenComplete(() => null);

      final path =
          await ref.getDownloadURL(); // Esperar a que termine la subida

      return path; // Devuelve la URL de la imagen subida
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<UserResponse> addDeworming(
      String userId, String petId, DewormingData dewormingData) async {
    try {
      final userDoc = await _firebaseFirestore.collection("users").doc(userId).get();

      if (!userDoc.exists) {
        return UserResponse(null, "User not found");
      }

      final pets = userDoc.data()?['pets'] as List<dynamic>;

      final petIndex = pets.indexWhere((p) => p['petId'] == petId);

      if (petIndex == -1) {
        return UserResponse(null, "Pet not found");
      }

      final pet = pets[petIndex];

      final List<dynamic> dewormings = pet.containsKey('dewormings')
          ? pet['dewormings'] as List<dynamic>
          : <dynamic>[];

      dewormings.add(dewormingData.toJson());

      pet['dewormings'] = dewormings;

      pets[petIndex] = pet;
      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": pets, 
      });

      return UserResponse(null, "dewormings added successfully");
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<UserResponse> addVaccination(
      String userId, String petId, VaccinationData vaccinationData) async {
    try {
      final userDoc = await _firebaseFirestore.collection("users").doc(userId).get();

      if (!userDoc.exists) {
        return UserResponse(null, "User not found");
      }

      final pets = userDoc.data()?['pets'] as List<dynamic>;

      final petIndex = pets.indexWhere((p) => p['petId'] == petId);

      if (petIndex == -1) {
        return UserResponse(null, "Pet not found");
      }

      final pet = pets[petIndex];

      final List<dynamic> vaccinations = pet.containsKey('vaccinations')
          ? pet['vaccinations'] as List<dynamic>
          : <dynamic>[];

      vaccinations.add(vaccinationData.toJson());

      pet['vaccinations'] = vaccinations;

      pets[petIndex] = pet;
      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": pets, 
      });

      return UserResponse(null, "Vaccination added successfully");
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }
}
