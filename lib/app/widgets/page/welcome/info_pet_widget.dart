import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pet extends StatelessWidget {
  const Pet({
    super.key, required this.imagePath, required this.name, required this.weight, required this.breed, required this.color,
  });

  final String imagePath; // Ruta de la imagen
  final String name;      // Nombre de la mascota
  final String weight;    // Peso de la mascota
  final String breed;     // Raza de la mascota
  final String color;     // Color de la mascota

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 260.0, 
          child: Column(
            children: [
              PetDetail(title: 'Name:', detail: name), // Detalle con título y valor
              PetDetail(title: 'Weight:', detail: weight),
              PetDetail(title: 'Breed:', detail: breed),
              PetDetail(title: 'Color:', detail: color),
            ],
          ),
        ),
      ],
    );
  }
}

class PetDetail extends StatelessWidget {
  final String title; // Título del detalle
  final String detail; // Valor del detalle

  const PetDetail({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        Text(
          detail,
          style: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}