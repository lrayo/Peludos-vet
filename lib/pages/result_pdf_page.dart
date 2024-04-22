import 'package:flutter/material.dart';
import 'package:peludos_pet/widgets/Header_widget.dart';
import 'package:peludos_pet/widgets/navegation_bar_widget.dart';
import 'package:peludos_pet/widgets/page/record/body_record_widget.dart';
import 'package:peludos_pet/widgets/page/result%20pdf/card_resultpdf_widget.dart';

class ResutlPdf extends StatelessWidget {
  const ResutlPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          HeaderWidget(),
          BodyRecordWidget(),
          CardResultsPdf(),
          
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}