import 'package:flutter/material.dart';
import 'package:peludos_pet/widgets/button_widget.dart';
import 'package:peludos_pet/widgets/page/record%20evaluation/info_record_evaluation_widget.dart';
import 'package:peludos_pet/widgets/page/result/info_result_widget.dart';
import 'package:peludos_pet/widgets/page/welcome/text_head_widget.dart';

class CardResults extends StatelessWidget {
  const CardResults ({super.key});

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
                  const InfoResults(description: "PP1 Blood test", date: "20/03/2024"),
                  
                  const Spacer(),
                  Padding( 
                    padding: const EdgeInsets.only(bottom: 20.0), 
                    child: Button(
                      text: 'Download',
                      onPressed: () {
                        Navigator.pushNamed(context, '/download');
                      },
                    ),
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

