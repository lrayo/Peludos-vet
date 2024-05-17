import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/inputs/deworming_data.dart';
import 'package:peludos_pet/app/domain/inputs/medical_history_data.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';
import 'package:peludos_pet/app/domain/inputs/result_data.dart';
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
      final filePath = "pets/$userId/${DateTime.now().toString()}";
      final ref = storage.ref().child(filePath);

      final uploadTask = ref.putFile(File(image.path));
      await uploadTask.whenComplete(() => null);

      final path = await ref.getDownloadURL();
      return path;
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<UserResponse> addDeworming(
      String userId, String petId, DewormingData dewormingData) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection("users").doc(userId).get();

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
      final userDoc =
          await _firebaseFirestore.collection("users").doc(userId).get();

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

  @override
  Future<UserResponse> addMedicalHistory(String userId, String petId,
      MedicalHistoryData medicalHistoryData) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection("users").doc(userId).get();

      if (!userDoc.exists) {
        return UserResponse(null, "User not found");
      }

      final pets = userDoc.data()?['pets'] as List<dynamic>;

      final petIndex = pets.indexWhere((p) => p['petId'] == petId);

      if (petIndex == -1) {
        return UserResponse(null, "Pet not found");
      }

      final pet = pets[petIndex];

      final List<dynamic> medicalHistories = pet.containsKey('medicalHistories')
          ? pet['medicalHistories'] as List<dynamic>
          : <dynamic>[];

      medicalHistories.add(medicalHistoryData.toJson());

      pet['medicalHistories'] = medicalHistories;

      pets[petIndex] = pet;

      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": pets,
      });

      return UserResponse(null, "Medical History added successfully");
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<UserResponse> addresult(
      String userId, String petId, ResultData resultData) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection("users").doc(userId).get();

      if (!userDoc.exists) {
        return UserResponse(null, "User not found");
      }

      final pets = userDoc.data()?['pets'] as List<dynamic>;

      final petIndex = pets.indexWhere((p) => p['petId'] == petId);

      if (petIndex == -1) {
        return UserResponse(null, "Pet not found");
      }

      final pet = pets[petIndex];

      final List<dynamic> results = pet.containsKey('results')
          ? pet['results'] as List<dynamic>
          : <dynamic>[];

      results.add(resultData.toJson());

      pet['results'] = results;

      pets[petIndex] = pet;

      await _firebaseFirestore.collection("users").doc(userId).update({
        "pets": pets,
      });

      return UserResponse(null, "results added successfully");
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }

  @override
  Future<String?> uploadPDF(String userId, String petId, XFile pdfFile) async {
  try {
    final filePath = "pdfs/$userId/$petId/${DateTime.now().toString()}";
    final ref = storage.ref().child(filePath);

    final uploadTask = ref.putFile(File(pdfFile.path));
    await uploadTask.whenComplete(() => null);

    final url = await ref.getDownloadURL();

    return url;
  } on FirebaseException catch (e) {
    final response = firebaseErrorToUserResponse(e.code);
    return response;
  }
}

  @override
  Future<File?> downloadPDF(String pdfURL, String fileName) async {
    try {
      final ref = storage.refFromURL(pdfURL);

      final File downloadFile = File('/path/to/downloads/$fileName');
      await ref.writeToFile(downloadFile);

      return downloadFile;
    } on FirebaseException catch (e) {
      final response = firebaseErrorToUserResponse(e.code);
      return response;
    }
  }
}
