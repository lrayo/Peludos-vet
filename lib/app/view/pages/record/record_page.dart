import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/home_screen.dart';
import 'package:peludos_pet/app/widgets/page/record/body_record_widget.dart';
import 'package:peludos_pet/app/widgets/page/record/card_record_widget.dart';

class Record extends StatelessWidget {
  const Record({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(bodyWidget: [BodyRecordWidget(),
          CardRecord(),])
    );
  }
}