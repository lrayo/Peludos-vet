import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      selectedItemColor: Colors.white, 
    unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem( // Color del fondo del cuadro del elemento seleccionado
        icon: Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)), // Color del ícono del elemento seleccionado
        label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blue, // Color del fondo del cuadro del elemento seleccionado
          icon: Icon(Icons.add),
          label: "Add Pet",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.green,
          icon: Icon(Icons.vaccines),
          label: "Results",
        ),
      ],
      currentIndex: paginaActual,
      onTap: (value) {
        log(value.toString());
          
        switch (value) {
          case 0:
            Navigator.pushNamed(context, Routes.HOME);
            break;
          case 1:
            Navigator.pushNamed(context, Routes.CHAT);
            break;

          case 2:
            Navigator.pushNamed(context, Routes.VACCINATION);
            break;
          default:
        }
      },
    );
  }
}
