import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_widget/button_widget.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/text_head_widget.dart';
import 'package:peludos_pet/app/view/pages/result/widgets/info_result_widget.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';

class CardResults extends StatelessWidget {
  const CardResults({super.key});

  final String petID = '72fafc44-d94e-4066-889a-26a8479d7062';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 410.0, left: 10.0, right: 10.0),
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
                  const InfoResults(
                      description: "PP1 Blood test", date: "20/03/2024"),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, right: 10.0),
                        child: Button(
                          text: 'Download',
                          onPressed: () {
                            Navigator.pushNamed(context, '/download');
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, left: 10.0),
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
  }
}
