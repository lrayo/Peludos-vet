import 'package:flutter/material.dart';
import 'package:peludos_pet/app/widgets/page/record%20evaluation/info_record_evaluation_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/text_head_widget.dart';

class CardRecordEvaluation extends StatelessWidget {
  const CardRecordEvaluation({super.key});

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
              child:  const Column(
                children: [
                  TextHead(
                    name: '',
                    text: 'Medical Evaluations',
                  ),
                  InfoRecordEvaluation(
                    title: 'Reason for Consultation: ',
                    description: 'Dante is experiencing a loss of appetite and lethargy.',
                  ),
                  InfoRecordEvaluation(
                    title: 'Medical History: ',
                    description: "Dante is an indoor cat who has been in generally good health until about a week ago, when his owner noticed a decrease in appetite. In recent days, he's been eating less than usual and seems less active than normal. There have been no observed instances of vomiting or diarrhea. Garfield has occasionally been coughing, but has not shown any other respiratory symptoms.",
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

