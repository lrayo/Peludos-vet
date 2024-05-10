// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/show_input_dialog.dart';

Future<void> updatePetName(
  BuildContext context,
  String userId,
  String key,
  String petID,
  String petName, 
  String dialogTitle, 
) async {
  try {
    final String? value = await showInputDialog(context, title: dialogTitle );

    if (value != null && value.isNotEmpty) {
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        throw Exception("User document does not exist");
      }

      final pets = userDoc['pets'] as List<dynamic>;

      final petIndex = pets.indexWhere((pet) => pet['petId'] == petID);

      if (petIndex == -1) {
        throw Exception("Pet not found with the name: $petName");
      }
      final updatedPets = List.from(pets);
      updatedPets[petIndex] = {
        ...updatedPets[petIndex],
        key: value, 
      };

      // Actualizar la lista de mascotas en Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .update({
        'pets': updatedPets, 
      });
    } else {
      Dialogs.alert(context,
          title: "Error", content: "Field 'name' cannot be empty");
    }
  } catch (e) {
    Dialogs.alert(context,
        title: "Error", content: "An error occurred while updating 'name'");
  }
}
