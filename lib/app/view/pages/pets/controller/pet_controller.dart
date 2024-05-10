// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/inputs/pet_up_data.dart';

import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/pages/pets/pets_state.dart';
import 'package:uuid/uuid.dart';

class PetsController extends StateNotifier<PetsState> {
  PetsController(super.initialState);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserRepository _userRepository = Get.find<UserRepository>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> selectAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      // Subir la imagen y obtener la URL
      final imageUrl = await _userRepository.imagePets(userId, image);
      state = state.copyWith(urlImage: imageUrl!);
    }
  }

  // Método para el botón de la cámara
  Future<void> uploadFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final imageUrl = await _userRepository.imagePets(userId, image);
      if (imageUrl != null) {
        state = state.copyWith(urlImage: imageUrl);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image uploaded. URL: $imageUrl")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to upload image")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image selected")),
      );
    }
  }

  Future<UserResponse> submit() {
    return _userRepository.addPets(
        userId,
        PetUpData(
          petId: const Uuid().v4(),
          color: state.color,
          name: state.name,
          breed: state.breed,
          age: state.age,
          weight: state.weight,
          photo: state.urlImage,
        ));
  }

  void onNamePetChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onWeightChanged(String text) {
    state = state.copyWith(weight: text);
  }

  void onBreedChanged(String text) {
    state = state.copyWith(breed: text);
  }

  void onColorChanged(String text) {
    state = state.copyWith(color: text);
  }

  void onUrlImageChanged(String text) {
    state = state.copyWith(urlImage: text);
  }

  void onAgeChanged(String text) {
    state = state.copyWith(age: text);
  }

  void onTermsOKChanged(bool value) {
    state = state.copyWith(termsOK: value);
  }
}

