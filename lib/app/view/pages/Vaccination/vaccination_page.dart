import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:peludos_pet/app/utils/name_validator.dart';
import 'package:peludos_pet/app/utils/weight_validator.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/Vaccination/controller/vaccination_controller.dart';
import 'package:peludos_pet/app/view/pages/Vaccination/utils/send_add_vaccination.dart';
import 'package:peludos_pet/app/view/pages/Vaccination/vaccination_state.dart';

final vaccinationprovider =
    StateProvider<VaccinationController, VaccinationState>(
        (_) => VaccinationController(
              VaccinationState( vaccinationDate: DateTime.now(),
            )));

class Vaccination extends StatefulWidget {
  const Vaccination({super.key});

  @override
  State<Vaccination> createState() => _VaccinationState();
}

class _VaccinationState extends State<Vaccination> {
  DateTime? selectedDate;

  void _selectDate(
      BuildContext context, VaccinationController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
      controller.onVaccinationDateChanged((picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final petID = ModalRoute.of(context)!.settings.arguments as String?;

    if (petID == null) {
      return const Center(child: Text("No pet ID provided"));
    }
    
    return ProviderListener<VaccinationController>(
      provider: vaccinationprovider,
      builder: (_, controller) {
        return Consumer(builder: (context, ref, _) {
      controller.setPetId(petID); // Configurar el petId en el controlador

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                color: Colors.transparent,
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    const SizedBox(height: 20.0),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 150.0),
                          const Center(
                            child: Text(
                              'Vaccination',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustonInputField(
                            label: 'Vaccination Name',
                            onChanged: controller.onNameVaccinationChanged,
                            validator: (text) {
                              return isValidName(text!) ? null : 'Invalid name';
                            },
                          ),
                          CustonInputField(
                            label: 'lote #',
                            isPassword: false,
                            inputType: TextInputType.emailAddress,
                            onChanged: controller.onLoteChanged,
                            validator: (text) {
                              return isValidWeight(text!)
                                  ? null
                                  : 'Invalid Weight';
                            },
                          ),
                          TextFormField(
                            controller: TextEditingController(
                              text: selectedDate != null
                                  ? DateFormat.yMd().format(selectedDate!)
                                  : '',
                            ),
                            decoration: InputDecoration(
                              labelText: 'Date',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () =>
                                    _selectDate(context, controller),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CupertinoButton(
                            color: Colors.purple,
                            onPressed: () {
                              sendAddVaccination(context);
                            },
                            child: const Text('Add vaccination'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
