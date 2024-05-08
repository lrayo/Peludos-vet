import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/utils/name_validator.dart';
import 'package:peludos_pet/app/utils/phone_validator.dart';
import 'package:peludos_pet/app/utils/weight_validator.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/pets/controller/pet_controller.dart';
import 'package:peludos_pet/app/view/pages/pets/pets_state.dart';
import 'package:peludos_pet/app/view/pages/pets/utils/send_add_pet.dart';

final petsprovider = StateProvider<PetsController, PetsState>(
  (_) => PetsController(PetsState()),
);

class Pets extends StatelessWidget {
  const Pets({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<PetsController>(
      provider: petsprovider,
      builder: (_, controller) {
        return Consumer(builder: (context, ref, _) {
          final stado = ref.watch(petsprovider);

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
                          Center(
                            child: Container(
                                color: Colors.transparent,
                                width: 180,
                                height: 180,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        radius: 80,
                                        backgroundImage:
                                            stado.state.urlImage.isEmpty
                                                ? null
                                                : NetworkImage(
                                                    stado.state.urlImage),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: IconButton(
                                        icon: const Icon(Icons.photo_library,
                                            color: Colors
                                                .blue), // Ícono para subir desde galería
                                        onPressed: () {
                                          controller
                                              .selectAndUploadImage(context);
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: const Icon(Icons.camera_alt,
                                            color: Colors
                                                .blue), // Ícono para tomar foto
                                        onPressed: () {
                                          controller.uploadFromCamera(context);
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          CustonInputField(
                            label: 'Pet Name',
                            onChanged: controller.onNamePetChanged,
                            validator: (text) {
                              return isValidName(text!) ? null : 'Invalid name';
                            },
                          ),
                          CustonInputField(
                            label: 'Weight',
                            isPassword: false,
                            inputType: TextInputType.emailAddress,
                            onChanged: controller.onWeightChanged,
                            validator: (text) {
                              return isValidWeight(text!)
                                  ? null
                                  : 'Invalid Weight';
                            },
                          ),
                          CustonInputField(
                            label: 'Breed',
                            onChanged: controller.onBreedChanged,
                            validator: (text) {
                              return isValidName(text!) ? null : 'Breed';
                            },
                          ),
                          CustonInputField(
                            label: 'Color',
                            onChanged: controller.onColorChanged,
                            validator: (text) {
                              return isValidName(text!)
                                  ? null
                                  : 'Invalid Color';
                            },
                          ),
                          CustonInputField(
                            label: 'Age',
                            onChanged: controller.onAgeChanged,
                            validator: (text) {
                              return isValidPhone(text!) ? null : 'Invalid Age';
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CupertinoButton(
                            color: Colors.purple,
                            onPressed: () {
                              sendAddPet(context);
                            },
                            child: const Text('Save'),
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
