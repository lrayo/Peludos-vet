import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/build_text_head.dart';
import 'package:peludos_pet/app/view/pages/pets/widgets/build_Pets_Widgets.dart';

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
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          final petsWidgets = buildPetsWidgets(snapshot.data!);

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
                        buildTextHead(ref),
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
