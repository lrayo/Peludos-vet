import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/home_screen.dart';
import 'package:peludos_pet/app/widgets/page/record%20evaluation/card_record_evaluation_widget.dart';
import 'package:peludos_pet/app/widgets/page/record/body_record_widget.dart';

class Evaluation extends StatelessWidget {
  const Evaluation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: HomeScreen(bodyWidget: [BodyRecordWidget(),
          CardRecordEvaluation()])
    );
  }
}