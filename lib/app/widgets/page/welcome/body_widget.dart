import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/widgets/page/welcome/buttons_rec_res_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/dividers_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/info_pet_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/next_vac_dew_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/text_head_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 10.0, right: 10.0),
          child: Center(
            child: Container(
              width: 400.0,
              height: 800.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: [
                  Consumer(builder: (_, ref, __) {
                    final user = ref.watch(sessionProvider).user!;
                    return TextHead(
                      name: user.displayName!,
                      text: 'Welcome to ',
                    );
                  }),
                  const Pet(
                    imagePath:
                        'assets/Imagen de WhatsApp 2024-03-22 a las 14.05.38_6c49771c.jpg',
                    name: 'Dante',
                    weight: '5.5 kg',
                    breed: 'Cat',
                    color: 'Gris',
                  ),
                  NextVacDew(
                    vaccinationDate: DateTime(2023, 8, 20),
                    dewormingDate: DateTime(2024, 2, 20),
                  ),
                  const ButtonsRecRes(),
                  const Dividers(),
                  const Pet(
                    imagePath: 'assets/maco.jpg',
                    name: 'Maco',
                    weight: '4.5 kg',
                    breed: 'Cat',
                    color: 'Calico',
                  ),
                  NextVacDew(
                    vaccinationDate: DateTime.now(),
                    dewormingDate: DateTime.now(),
                  ),
                  const ButtonsRecRes(),
                  const Dividers(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
