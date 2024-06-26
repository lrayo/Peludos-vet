import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/text_head_widget.dart';
import 'package:peludos_pet/app/view/pages/medical_history/medical_history_detail.dart';
import 'package:peludos_pet/app/view/pages/record/widgets/info_record_widget.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

class CardRecord extends ConsumerWidget {
  const CardRecord({super.key});
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
        final pets = userDoc.exists && userDoc['pets'] != null
            ? userDoc['pets'] as List<dynamic>
            : [];

        final selectedPet = pets.firstWhere(
          (pet) => pet['petId'] == petId,
          orElse: () => null,
        );

        if (selectedPet == null) {
          return const Center(child: Text("Pet not found"));
        }

        final vaccinations = selectedPet.containsKey('vaccinations')
            ? selectedPet['vaccinations'] as List<dynamic>
            : <dynamic>[];

        final dewormings = selectedPet.containsKey('dewormings')
            ? selectedPet['dewormings'] as List<dynamic>
            : <dynamic>[];

        final medicalHistories = selectedPet.containsKey('medicalHistories')
            ? selectedPet['medicalHistories'] as List<dynamic>
            : <dynamic>[];

        final List<String> namesVaccination = [];
        final List<String> namesDeworming = [];
        final List<DateTime> vaccinationDates = [];
        final List<DateTime> dewormingDates = [];
        final List<DateTime> medicalHistoryDates = [];
        final List<String> medicalHistoryDescriptions = [];
        final List<String> reasonForConsultation = [];
        final petid = selectedPet['petId'] as String;

// Obtener los nombres de vacunación y las fechas
        for (var vaccination in vaccinations) {
          final name = vaccination['nameVaccination'];
          final date = DateTime.parse(vaccination['vaccinationDate']);
          if (name != null) {
            namesVaccination.add(name);
            vaccinationDates.add(date);
          }
        }

// Obtener los nombres de desparasitación y las fechas
        for (var medicalHistory in medicalHistories) {
          final reasonForConsultaion = medicalHistory['reasonForonsultation'];
          final description = medicalHistory['description'];
          final date = DateTime.parse(medicalHistory['medicalHistoryDate']);
          if (reasonForConsultaion != null) {
            reasonForConsultation.add(reasonForConsultaion);
            medicalHistoryDescriptions.add(description);
            medicalHistoryDates.add(date);
          }
        }

        // Obtener los nombres de desparasitación y las fechas
        for (var deworming in dewormings) {
          final name = deworming['namedeworming'];
          final date = DateTime.parse(deworming['dewormingDate']);
          if (name != null) {
            namesDeworming.add(name);
            dewormingDates.add(date);
          }
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 410.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Center(
                child: Container(
                  width: 400.0,
                  height: 600.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: [
                      const TextHead(
                        name: '',
                        text: 'Record',
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: vaccinations.length,
                        itemBuilder: (context, index) {
                          final date = vaccinationDates[index];
                          return InfoRecord(
                            title: 'Vaccination: ',
                            description: namesVaccination[index],
                            date: date,
                            onTap: () {
                              router.pushNamed(Routes.VACCINATION,
                                  arguments: petId);
                            },
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: dewormings.length,
                        itemBuilder: (context, index) {
                          final date = dewormingDates[index];
                          return InfoRecord(
                            title: 'Deworming: ',
                            description: namesDeworming[index],
                            date: date,
                            onTap: () {
                              router.pushNamed(Routes.DEWORMING,
                                  arguments: petId);
                            },
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: medicalHistories.length,
                        itemBuilder: (context, index) {
                          final date = medicalHistoryDates[index];
                          return InfoRecord(
                            title: 'Medical History:',
                            description: reasonForConsultation[index],
                            date: date,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicalHistoryDetail(
                                    petID: petid,
                                    title: 'Medical History Detail',
                                    date: date,
                                    reasonForConsultation:
                                        reasonForConsultation[index],
                                    description:
                                        medicalHistoryDescriptions[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
