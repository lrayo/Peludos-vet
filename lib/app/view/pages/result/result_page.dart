import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/home_screen.dart';
import 'package:peludos_pet/app/view/pages/record/widgets/body_record_widget.dart';
import 'package:peludos_pet/app/view/pages/result/widgets/card_result_widget.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(bodyWidget: [BodyRecordWidget(),
          CardResults()])
      
    );
  }
}