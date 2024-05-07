import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peludos_pet/app/view/pages/profile/profile_page.dart';

// GlobalKey para controlar el Scaffold
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HeaderWidget extends StatelessWidget {
  final VoidCallback onMenuPressed; // Callback para abrir el Drawer
  const HeaderWidget({super.key, required this.onMenuPressed});

  final tituloTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 26.0,
    fontWeight: FontWeight.bold
  );
  final subtituloTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(25),
      height: 150.0,
      decoration: const BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'P', // Primera letra en mayúscula
                        style: GoogleFonts.tapestry(
                          textStyle: const TextStyle(
                            fontSize: 70.0, // Tamaño de la primera letra
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
                            fontSize: 50.0, // Tamaño del resto del texto
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
          Row(
            children: [
              
              IconButton(
                padding: const EdgeInsets.only(top: 15.0),
                icon: const Icon(Icons.dehaze, color: Colors.black, size: 50.0),
                onPressed: onMenuPressed, // Callback para abrir el Drawer
              ),
              const SizedBox(width: 10.0),
              IconButton(
                padding: const EdgeInsets.only(top: 15.0),
                icon: const Icon(Icons.account_circle, color: Colors.black, size: 50.0),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ProfileScreen(), // Ejemplo de otra pantalla
                  ));
                },
              ),
            ],
          )
        ],
      )
    );
  }


}


 