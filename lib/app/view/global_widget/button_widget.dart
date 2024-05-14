import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 100, 9, 9).withOpacity(0.8),
                spreadRadius: -4,
                blurRadius: 10,
                offset: const Offset(5, 9)
            )
          ]
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(double.infinity, 50.0)
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      );
  }
}