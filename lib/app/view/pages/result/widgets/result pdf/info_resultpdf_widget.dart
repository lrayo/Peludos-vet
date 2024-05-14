import 'package:flutter/material.dart';

class InfoResultsPdf extends StatelessWidget {

  final String image; 
  

  const InfoResultsPdf({
    super.key, required this.image, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Image.asset(image, fit: BoxFit.fill, width: 380.0, height: 400.0,)
    );
  }
}
