import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:peludos_pet/app/widgets/page/welcome/buttons_rec_res_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/dividers_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/info_pet_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/next_dew_wigget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/next_vac_dew_widget.dart';

List<Widget> buildPetsWidgets(DocumentSnapshot userDoc) {
  final pets = userDoc.exists && userDoc['pets'] != null
      ? userDoc['pets'] as List<dynamic>
      : [];
  return pets.map((pet) {
    final petId = pet['petId'];
    final name = pet['name'];
    final breed = pet['breed'];
    final weight = pet['weight'];
    final photo = pet['photo'];
    final age = pet['age'];
    final color = pet['color'];
    final vaccinations = pet.containsKey('vaccinations')
        ? pet['vaccinations'] as List<dynamic>
        : <dynamic>[];

    DateTime? vaccinationDate;
    if (vaccinations.isNotEmpty) {
      final sortedVaccinations = [...vaccinations]..sort((a, b) =>
          DateTime.parse(b['vaccinationDate'])
              .compareTo(DateTime.parse(a['vaccinationDate'])));
      final lastVaccination = sortedVaccinations.first;
      vaccinationDate = DateTime.parse(lastVaccination['vaccinationDate']);
    } else {
      vaccinationDate = null;
    }

    final dewormings = pet.containsKey('dewormings')
        ? pet['dewormings'] as List<dynamic>
        : <dynamic>[];

    DateTime? dewormingDate;
    if (dewormings.isNotEmpty) {
      final sortedDewormings = [...dewormings]..sort((a, b) =>
          DateTime.parse(b['dewormingDate'])
              .compareTo(DateTime.parse(a['dewormingDate'])));
      final lastDeworming = sortedDewormings.first;
      dewormingDate = DateTime.parse(lastDeworming['dewormingDate']);
    } else {
      dewormingDate = null;
    }

    return GestureDetector(
      onTap: () {
        router.pushNamed(Routes.PETUPDATE, arguments: petId);
      },
      child: Column(
        children: [
          Pet(
            imagePath: photo,
            name: name,
            weight: "$weight kg",
            breed: breed,
            color: color,
            age: '$age years',
          ),
          GestureDetector(
            onTap: () {
              router.pushNamed(Routes.VACCINATION, arguments: petId);
            },
            child: NextVac(
              vaccinationDate: vaccinationDate,
            ),
          ),
          GestureDetector(
            onTap: () {
              router.pushNamed(Routes.DEWORMING, arguments: petId);
            },
            child: NextDew(
              dewormingDate: dewormingDate,
            ),
          ),
          ButtonsRecRes(petId: petId),
          const Dividers(),
        ],
      ),
    );
  }).toList();
}
