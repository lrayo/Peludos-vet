

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
    final pets = userDoc.exists && userDoc['pets'] != null ? userDoc['pets'] as List<dynamic> : [];
    return pets.map((pet) {
      final petId = pet['petId'];
      final name = pet['name'];
      final breed = pet['breed'];
      final weight = pet['weight'];
      final photo = pet['photo'];
      final age = pet['age'];
      final color = pet['color'];
      final vaccinations = pet.containsKey('vaccinations') ? pet['vaccinations'] as List<dynamic> : <dynamic>[];

      DateTime? vaccinationDate;
      if (vaccinations.isNotEmpty) {
        final lastVaccination = vaccinations.last;
        vaccinationDate = DateTime.parse(lastVaccination['vaccinationDate']); // Convierte a DateTime
      } else {
        vaccinationDate = null;
      }

      final dewormings = pet.containsKey('dewormings') ? pet['dewormings'] as List<dynamic> : <dynamic>[];

      DateTime? dewormingDate;
      if (dewormings.isNotEmpty) {
        final lastDewormings = dewormings.last;
        dewormingDate = DateTime.parse(lastDewormings['dewormingDate']); // Convierte a DateTime
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
                router.pushNamed(Routes.PETUPDATE, arguments: petId);
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
            const ButtonsRecRes(),
            const Dividers(),
          ],
        ),
      );
    }).toList();
  }