import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/build_text_head.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/info_pet_widget.dart';

class BodyRecordWidget extends ConsumerWidget {
  const BodyRecordWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final petId = ModalRoute.of(context)!.settings.arguments as String?;
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()); // Cargando datos
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }
          final userDoc = snapshot.data!;
        final pets = userDoc.exists && userDoc['pets'] != null ? userDoc['pets'] as List<dynamic> : [];

        final selectedPet = pets.firstWhere((pet) => pet['petId'] == petId, orElse: () => null);

        if (selectedPet == null) {
          return const Center(child: Text("Pet not found"));
        }

        final name = selectedPet['name'];
        final breed = selectedPet['breed'];
        final weight = selectedPet['weight'];
        final photo = selectedPet['photo'];
        final age = selectedPet['age'];
        final color = selectedPet['color'];



          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 160.0, left: 10.0, right: 10.0),
                child: Center(
                  child: Container(
                    width: 400.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        buildTextHead(ref),
                         Pet(
                          imagePath:
                              photo ?? 'https://via.placeholder.com/150',
                          name: name,
                          weight: '$weight kg',
                          breed: breed,
                          color: color,
                          age: '$age years',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
