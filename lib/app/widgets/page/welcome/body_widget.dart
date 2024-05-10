import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:peludos_pet/app/widgets/page/welcome/buttons_rec_res_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/dividers_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/info_pet_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/next_vac_dew_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/text_head_widget.dart';

class BodyWidget extends ConsumerWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()); // Cargando datos
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          final userDoc = snapshot.data!;
          final pets = userDoc['pets'] as List<dynamic>;

          final petsWidgets = pets.map((pet) {
            final petId = pet['petId'];
            final name = pet['name'];
            final breed = pet['breed'];
            final weight = pet['weight'];
            final photo = pet['photo'];
            final age = pet['age'];
            final color = pet['color'];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.PETUPDATE, arguments: petId);
              },
              child: Column(
                children: [
                  Pet(
                    imagePath: photo,
                    name: name,
                    weight: "$weight kg", 
                    breed: breed,
                    color: color,
                    age: '$age years', 
                  ),
                  NextVacDew(
                    vaccinationDate:
                        DateTime.now(), 
                    dewormingDate: DateTime.now(),
                  ),
                  const ButtonsRecRes(),
                  const Dividers(),
                ],
              ),
            );
          }).toList();
          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 160.0, left: 10.0, right: 10.0),
                child: Center(
                  child: Container(
                    width: 400.0,
                    height: 800.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Consumer(builder: (_, ref, __) {
                          final user = ref.watch(sessionProvider).user!;
                          return TextHead(
                            name: user.displayName!,
                            text: 'Welcome to ',
                          );
                        }),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          height: 700.0,
                          child: ListView(
                            children: petsWidgets,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
