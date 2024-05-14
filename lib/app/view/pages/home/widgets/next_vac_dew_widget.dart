// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVac extends StatelessWidget {
  final DateTime? vaccinationDate; // Fecha de la próxima vacunación


  const NextVac({
    super.key,
    required this.vaccinationDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Vaccination: ',
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  vaccinationDate != null
                      ? '${vaccinationDate?.day}/${vaccinationDate?.month}/${vaccinationDate?.year}'
                      : 'Pet not vaccinated',
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: vaccinationDate != null ? Colors.black : Colors.red,
                  ),
                ),
                if (vaccinationDate != null)
                  Text(
                    daysUntilNextVaccination(), // Días restantes hasta la próxima vacunación
                    style: GoogleFonts.inter(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String daysUntilNextVaccination() {
    final now = DateTime.now();

    // Determinar la próxima fecha de vacunación
    final nextVaccination = vaccinationDate!.isBefore(now)
        ? DateTime(vaccinationDate!.year + 1, vaccinationDate!.month,
            vaccinationDate!.day)
        : vaccinationDate;

    final difference = nextVaccination?.difference(now).inDays;

    return difference == 0 ? "now" : "$difference days";
  }
}
