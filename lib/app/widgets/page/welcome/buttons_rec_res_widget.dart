import 'package:flutter/material.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:peludos_pet/app/widgets/button_widget.dart';

class ButtonsRecRes extends StatelessWidget {
  final String petId;
  const ButtonsRecRes({
    super.key,
    required this.petId
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child:  Padding(
        padding:  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(text: 'Record', onPressed: () {
                  Navigator.pushNamed(context, Routes.RECORD, arguments: petId);
                }),
                Button(text: 'Results', onPressed: () {
                  Navigator.pushNamed(context, Routes.RESULT, arguments: petId);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
