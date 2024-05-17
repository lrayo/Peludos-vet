import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:peludos_pet/app/utils/address_validator.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/deworming/controller/deworming_controller.dart';
import 'package:peludos_pet/app/view/pages/deworming/dewormig_state.dart';
import 'package:peludos_pet/app/view/pages/deworming/utils/send_add_deworming.dart';

final dewormingprovider =
    StateProvider<DewormingController, DewormigState>(
        (_) => DewormingController(
              DewormigState( dewormingDate: DateTime.now(),
            )));

class Deworming extends StatefulWidget {
  const Deworming({super.key});

  @override
  State<Deworming> createState() => _DewormingState();
}

class _DewormingState extends State<Deworming> {
  DateTime? selectedDate;

  void _selectDate(
      BuildContext context, DewormingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
      controller.onDewormingDateChanged((picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final petID = ModalRoute.of(context)!.settings.arguments as String?;

    if (petID == null) {
      return const Center(child: Text("No pet ID provided"));
    }
    
    return ProviderListener<DewormingController>(
      provider: dewormingprovider,
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
                              'Deworming',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustonInputField(
                            label: 'Deworming Name',
                            onChanged: controller.onNameDewormingChanged,
                            validator: (text) {
                              return isValidAddress(text!) ? null : 'Invalid name';
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
                              sendAddDeworming(context);
                            },
                            child: const Text('Add Deworming'),
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
