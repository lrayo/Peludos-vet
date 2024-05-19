// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:peludos_pet/app/utils/name_validator.dart';
import 'package:peludos_pet/app/view/global_widget/button_widget.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/result/controller/result_controller.dart';
import 'package:peludos_pet/app/view/pages/result/result_state.dart';
import 'package:peludos_pet/app/view/pages/result/utils/send_add_result.dart';

final resultprovider = StateProvider<ResultController, ResultState>(
    (_) => ResultController(ResultState(
          resultDate: DateTime.now(),
        )));

class ResultForm extends StatefulWidget {
  const ResultForm({super.key});

  @override
  State<ResultForm> createState() => _ResultFormState();
}

class _ResultFormState extends State<ResultForm> {
  DateTime? selectedDate;

  void _selectDate(BuildContext context, ResultController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() => selectedDate = picked);
      controller.setResultDate((picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final petID = ModalRoute.of(context)!.settings.arguments as String?;

    if (petID == null) {
      return const Center(child: Text("No pet ID provided"));
    }

    return ProviderListener<ResultController>(
      provider: resultprovider,
      builder: (_, controller) {
        return Consumer(builder: (context, ref, _) {
          final state = ref.watch(resultprovider);
          controller.setPetId(petID); // Configurar el petId en el controlador

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Add Result'),
              centerTitle: true,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 100,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20.0),
                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 5),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Image.asset(
                                    'assets/Perros-y-gatos-juntos.jpeg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const Center(
                                  child: Text(
                                    'Result Form',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustonInputField(
                                  label: 'Exam Name',
                                  onChanged: controller.setExamName,
                                  validator: (text) {
                                    return isValidNameResult(text!)
                                        ? null
                                        : 'Invalid name';
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
                                const SizedBox(height: 20.0),
                                Button(
                                  text: 'Select PDF',
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf'],
                                    );

                                    if (result != null) {
                                      XFile file =
                                          XFile(result.files.single.path!);
                                      await controller.uploadPDF(context, file);
                                    }
                                  },
                                ),
                                if (state.state.pdfURL.isNotEmpty)
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text('PDF uploaded successfully',
                                          style:
                                              TextStyle(color: Colors.green))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottomSheet: Container(
              width: 200.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              color: Colors.white,
              child: Button(
                text: 'Add result',
                onPressed: () {
                  sendAddResutl(context);
                },
              ),
            ),
          );
        });
      },
    );
  }
}
