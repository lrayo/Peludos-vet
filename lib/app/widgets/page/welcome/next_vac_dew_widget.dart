// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextVacDew extends StatelessWidget {
  final DateTime? vaccinationDate; // Fecha de la próxima vacunación
  final DateTime? dewormingDate; // Fecha de la próxima desparasitación

  const NextVacDew({
    super.key,
    required this.vaccinationDate,
    required this.dewormingDate,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Deworming: ',
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                dewormingDate != null
                    ? Text(
                        '${dewormingDate?.day}/${dewormingDate?.month}/${dewormingDate?.year}',
                        style: GoogleFonts.inter(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        'Pet not dewormed', // Mensaje si no hay fecha
                        style: GoogleFonts.inter(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                if (dewormingDate != null)
                  Text(
                    daysUntilNextDeworming(), // Días restantes
                    style: GoogleFonts.inter(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
              ],
            )
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

  String daysUntilNextDeworming() {
    final now = DateTime.now();
    DateTime? targetDate = dewormingDate;

    const interval = Duration(days: 120); // Intervalo para la desparasitación

    while (targetDate!.isBefore(now)) {
      targetDate = targetDate
          .add(interval); // Sumar 120 días para la próxima desparasitación
    }

    final difference = targetDate.difference(now).inDays;

    return difference == 0 ? "now" : "$difference days";
  }
}
