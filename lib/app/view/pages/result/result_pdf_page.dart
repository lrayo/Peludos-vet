import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/global_widget/home_screen.dart';
import 'package:peludos_pet/app/view/pages/record/widgets/body_record_widget.dart';
import 'package:peludos_pet/app/view/pages/result/widgets/result%20pdf/card_resultpdf_widget.dart';

class ResutlPdf extends StatelessWidget {
  const ResutlPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeScreen(bodyWidget: const [BodyRecordWidget(),
          CardResultsPdf(),])
      
    );
  }
}