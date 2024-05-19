import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/global_widget/button_widget.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/text_head_widget.dart';
import 'package:peludos_pet/app/view/pages/result/widgets/info_result_widget.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

class CardResults extends ConsumerWidget {
  const CardResults({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final petId = ModalRoute.of(context)!.settings.arguments as String?;
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

          final userDoc = snapshot.data!;
          final pets = userDoc.exists && userDoc['pets'] != null
              ? userDoc['pets'] as List<dynamic>
              : [];

          final selectedPet = pets.firstWhere(
            (pet) => pet['petId'] == petId,
            orElse: () => null,
          );

          if (selectedPet == null) {
            return const Center(child: Text("Pet not found"));
          }

          final results = selectedPet.containsKey('results')
              ? selectedPet['results'] as List<dynamic>
              : <dynamic>[];

          final List<String> examName = [];
          final List<DateTime> resultDate = [];
          final List<String> resultId = [];
          final petID = selectedPet['petId'] as String;

          for (var result in results) {
            final name = result['examName'];
            final date = DateTime.parse(result['resultDate']);
            final id = result['resultId'];

            if (name != null) {
              examName.add(name);
              resultDate.add(date);
              resultId.add(id);
            }
          }

          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 410.0, left: 10.0, right: 10.0),
                child: Center(
                  child: Container(
                    width: 400.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: [
                        const TextHead(
                          name: '',
                          text: 'Result',
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: examName.length,
                          itemBuilder: (context, index) {
                            final date = resultDate[index];
                            final id = resultId[index];
                            return InfoResults(
                              description: examName[index],
                              date: date,
                              onTap: () {
                                router.pushNamed(Routes.RESULTPDF,
                                    arguments: {
                                  'resultID': id,
                                  'petID': petID,
                                },);
                              },
                            );
                          },
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, right: 10.0),
                              child: Button(
                                text: 'Download',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/download');
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0),
                              child: Button(
                                text: 'Add Result',
                                onPressed: () {
                                  router.pushNamed(Routes.ADD_RESULT,
                                      arguments: petID);
                                },
                              ),
                            ),
                          ],
                        )
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
