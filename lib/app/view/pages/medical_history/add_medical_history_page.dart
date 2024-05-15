import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:peludos_pet/app/utils/address_validator.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/medical_history/controller/medical_history_controller.dart';
import 'package:peludos_pet/app/view/pages/medical_history/medical_history_state.dart';
import 'package:peludos_pet/app/view/pages/medical_history/utils/send_add_medical_history.dart';

final medicalhistoryprovider =
    StateProvider<MedicalHistoryController, MedicalState>(
        (_) => MedicalHistoryController(
              MedicalState(
                medicalHistoryDate: DateTime.now(),
              ),
            ));

class AddMedicalHistory extends StatefulWidget {
  const AddMedicalHistory({super.key});

  @override
  State<AddMedicalHistory> createState() => _AddMedicalHistoryState();
}

class _AddMedicalHistoryState extends State<AddMedicalHistory> {
  DateTime? selectedDate;

  void _selectDate(
      BuildContext context, MedicalHistoryController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
      controller.onDateChanged((picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final petID = ModalRoute.of(context)!.settings.arguments as String?;
    const petID = '8f7869f0-7e55-49a3-b805-021d65b0aa54'; // Simular el petId
    // if (petID == null) {
    //   return const Center(child: Text("No pet ID provided"));
    // }

    return ProviderListener<MedicalHistoryController>(
        provider: medicalhistoryprovider,
        builder: (_, controller) {
          return Consumer(builder: (context, ref, _) {
            controller.setPetId(petID); // Configurar el petId en el controlador

            return Scaffold(
              
              appBar: AppBar(
                title: const Text("Add Medical History"),
              ),
              body: Center(
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    const SizedBox(height: 20.0),
                    Form(
                      key: controller.formMedicalKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 150.0),
                          const Center(
                            child: Text(
                              'Medical History',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                          CustonInputField(
                            label: 'Reason for consultation',
                            isPassword: false,
                            inputType: TextInputType.multiline,
                            onChanged: controller.onReasonForonsultationChanged,
                            validator: (text) {
                              return isValidAddress(text!)
                                  ? null
                                  : 'Invalid Reason for consultation';
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Description',
                              hintText: 'Enter description here...',
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: controller.onDescriptionChanged,
                            validator: (text) {
                              return isValidAddress(text!)
                                  ? null
                                  : 'Invalid Description';
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CupertinoButton(
                            color: Colors.purple,
                            onPressed: () {
                              sendAddMedicalHistory(context);
                            },
                            child: const Text('Add Medical History'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
