import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  const Dividers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: SizedBox(
          width: 300.0,
          child: Divider(
            // Línea separadora
            color: Colors.grey,
            thickness: 1,
            height: 20, 
          ),
        ),
      ),
    );
  }
}
