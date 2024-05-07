import 'package:flutter/material.dart';
import 'package:peludos_pet/app/widgets/page/welcome/info_pet_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/text_head_widget.dart';

class BodyRecordWidget extends StatelessWidget {
  const BodyRecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 10.0, right: 10.0),
          child: Center(
            child: Container(
              width: 400.0,
              height: 230.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child:  const Column(
                children: [
                  TextHead(
                    name: 'Lina Rios',
                    text: 'Welcome to ',
                  ),
                  Pet(
                    imagePath: 'assets/Imagen de WhatsApp 2024-03-22 a las 14.05.38_6c49771c.jpg',
                    name: 'Dante',
                    weight: '5.5 kg',
                    breed: 'Cat',
                    color: 'Gris',
                  ),
                  
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

