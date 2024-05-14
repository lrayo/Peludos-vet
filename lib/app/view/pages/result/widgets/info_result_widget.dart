import 'package:flutter/material.dart';

class InfoResults extends StatelessWidget {

  final String description; 
  final String date;

  const InfoResults({
    super.key, required this.description, required this.date,
  });

  void _navigateToEvaluation(BuildContext context) {
    Navigator.pushNamed(context, '/resultPdf'); // Navegar a la página de evaluación
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _navigateToEvaluation(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
