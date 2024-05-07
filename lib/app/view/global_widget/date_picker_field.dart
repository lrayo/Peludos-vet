

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final void Function(DateTime date) onDateChanged;

  const DatePickerField({super.key, required this.labelText, required this.controller, required this.onDateChanged});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text =
          DateFormat.yMd().format(pickedDate); // Formatear la fecha
      onDateChanged(pickedDate); // Llamar al controlador
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context), // Abrir el selector de fechas
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: const Icon(Icons
                .calendar_today), // Icono para indicar que es un campo de fecha
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select a date";
            }
            return null;
          },
        ),
      ),
    );
  }
}
