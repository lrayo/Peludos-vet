import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHead extends StatelessWidget {

  final String name;
  final String text;
  const TextHead({
    super.key, required this.name, required this.text,
  });

  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20.0, right: 10.0),
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 197, 185, 185),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
