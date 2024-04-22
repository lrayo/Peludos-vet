import 'package:flutter/material.dart';
import 'package:peludos_pet/widgets/Header_widget.dart';
import 'package:peludos_pet/widgets/navegation_bar_widget.dart';
import 'package:peludos_pet/widgets/page/record%20evaluation/card_record_evaluation_widget.dart';
import 'package:peludos_pet/widgets/page/record/body_record_widget.dart';

class Evaluation extends StatelessWidget {
  const Evaluation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          HeaderWidget(),
          BodyRecordWidget(),
          CardRecordEvaluation()
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}