import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoRecordEvaluation extends StatelessWidget {

  final String title; 
  final String description;

  const InfoRecordEvaluation({
    super.key, required this.description, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
