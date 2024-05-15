import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';


class MedicalHistoryDetail extends ConsumerWidget {
  final String petID;
  final String title;
  final String reasonForConsultation;
  final String description;
  final DateTime date;

  const MedicalHistoryDetail({
    super.key,
    required this.petID,
    required this.title,
    required this.reasonForConsultation,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context, ref) {
    final petId = petID;
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
          final pets = userDoc.exists && userDoc['pets'] != null
              ? userDoc['pets'] as List<dynamic>
              : [];

          final selectedPet = pets.firstWhere((pet) => pet['petId'] == petId,
              orElse: () => null);

          if (selectedPet == null) {
            return const Center(child: Text("Pet not found"));
          }

          final name = selectedPet['name'];
          final photo = selectedPet['photo'];


          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(
              children: [
                Container(
                  width: 400.0,
                  height: 230.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      Column(
                        children: [
                          Center(
                            child: Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(photo),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            
                          ),
                          Center(
                            
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date of Consultation',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('d/M/yyyy').format(date),
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Reason for Consultation',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        reasonForConsultation,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        'Description',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
