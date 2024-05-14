import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo de la aplicación
        Container(
          color: Colors.black,
        ),
        // Imagen de fondo de la aplicación
        Container(
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            image: DecorationImage(
              image: AssetImage('assets/gato2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradiente del fondo de la aplicación
        Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.5),
                  const Color(0xFFF4D4DA).withOpacity(0.5),
                ],
              ),
            )),
        // Logo de la aplicación
        Positioned(
          top: 15,
          left: 0,
          right: 70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'P', // Primera letra en mayúscula
                        style: GoogleFonts.tapestry(
                          textStyle: const TextStyle(
                            fontSize: 128.0, // Tamaño de la primera letra
                            color: Color(0xFFFFEFEF),
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // Color del contorno
                                offset: Offset(2, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'eludos', // Resto del texto
                        style: GoogleFonts.tapestry(
                          textStyle: const TextStyle(
                            fontSize: 64.0, // Tamaño del resto del texto
                            color: Color(0xFFFFEFEF),
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // Color del contorno
                                offset: Offset(2, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
