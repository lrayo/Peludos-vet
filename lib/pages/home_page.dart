
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peludos_pet/widgets/page/welcome/body_widget.dart';
import 'package:peludos_pet/widgets/header_widget.dart';
import 'package:peludos_pet/widgets/navegation_bar_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          HeaderWidget(),
          BodyWidget(),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget()
    );
  }
}