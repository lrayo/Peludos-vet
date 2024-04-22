import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peludos_pet/animations/cat_animation.dart';
import 'package:peludos_pet/widgets/button_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imagen de Fondo de la aplicación
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradiente del fondo de la aplicación
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                const Color(0xFFF4D4DA).withOpacity(0.4)
              ],
              stops: const [0.3, 1.0],
            )),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
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
                                  color: Color.fromARGB(255, 0, 0, 0), // Color del contorno
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
                                  color: Color.fromARGB(255, 0, 0, 0), // Color del contorno
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
          Positioned(
            top: 400,
            left: 150,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'V', // Primera letra en mayúscula
                          style: GoogleFonts.tapestry(
                            textStyle: const TextStyle(
                              fontSize: 128.0, // Tamaño de la primera letra
                              color: Color(0xFFFFEFEF),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0), // Color del contorno
                                  offset: Offset(2, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextSpan(
                          text: 'et', // Resto del texto
                          style: GoogleFonts.tapestry(
                            textStyle: const TextStyle(
                              fontSize: 64.0, // Tamaño del resto del texto
                              color: Color(0xFFFFEFEF),
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0), // Color del contorno
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
          // Animación de la imagen
          const CatAnimation(),
          // Boton login
          Positioned(
            bottom: 60,
            left: 40,
            right: 40,
            child: Button(
              text: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
          // Texto de registro
          Positioned(
            bottom: 25.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                            text: "Sing up",
                            style: const TextStyle(
                                color: Color(0xff851111),
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              })
                      ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
