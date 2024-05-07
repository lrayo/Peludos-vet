import 'package:flutter/material.dart';
import 'package:peludos_pet/app/widgets/page/record/info_record_widget.dart';
import 'package:peludos_pet/app/widgets/page/welcome/text_head_widget.dart';

class CardRecord extends StatelessWidget {
  const CardRecord({super.key});

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
                    text: 'Record',
                    
                  ),
                  InfoRecord(
                    description: 'Medical History: ',
                    date: '2024-03-22',
                  ),
                  InfoRecord(
                    description: 'Deworming: ',
                    date: '2024-03-22',
                  ),
                  InfoRecord(
                    description: 'Vaccination: ',
                    date: '2024-03-22',
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

