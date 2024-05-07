import 'package:flutter/material.dart';
import 'package:peludos_pet/app/widgets/page/result%20pdf/info_resultpdf_widget.dart';

class CardResultsPdf extends StatelessWidget {
  const CardResultsPdf ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 410.0, left: 10.0, right: 10.0),
          child: Center(
            child: Container(
              width: 400.0,
              height: 600.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Column(
                children: [
                  InfoResultsPdf(image: "assets/imagesk.png",)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

