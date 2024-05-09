import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/pages/pets/utils/funtion_pet_udpdate.dart';

class PetUpdate extends StatelessWidget {
  const PetUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Udate"),
      ),
      body: const Center(
        child: PetUp(),
      ),
    );
  }
}

class PetUp extends ConsumerWidget {
  const PetUp({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    // Obtener el nombre pasado como argumento
    final petID = ModalRoute.of(context)!.settings.arguments as String?;

    if (petID == null) {
      return const Center(child: Text("No name provided"));
    }
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator()); // Cargando datos
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          final userDoc = snapshot.data!;
          final pets = userDoc['pets'] as List<dynamic>;

          // Buscar la mascota con el nombre que coincide con el argumento
          final matchingPet = pets.firstWhere(
            (pet) => pet['petId'] == petID,
            orElse: () => null, // Si no se encuentra, devolver `null`
          );

          if (matchingPet == null) {
            return Center(child: Text("No pet found with the name: $petID"));
          }

          // Extraer la información de la mascota encontrada
          final name = matchingPet['name'];
          final breed = matchingPet['breed'];
          final weight = matchingPet['weight'];
          final photo = matchingPet['photo'];
          final age = matchingPet['age'];
          final color = matchingPet['color'];
          final letter = name.isNotEmpty ? name[0] : '';

          // Pasar información al Progfile
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 80.0,
                backgroundImage: photo != null && photo.isNotEmpty
                    ? NetworkImage(photo!)
                    : null,
                child: photo == null || photo!.isEmpty
                    ? Text(
                        letter,
                        style: const TextStyle(fontSize: 65.0),
                      )
                    : null,
              ),
              const SizedBox(height: 20.0),
              Center(
                  child: Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0))),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text('Contact Information',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              LabelButton(
                label: 'Name:',
                value: name,
                leadingIcon: Icons.person,
                trailingIcon: Icons.edit,
                onPressed: () {
                  updatePetName(context, user.uid, 'name',
                      petID, name, "Enter new pet name");
                },
              ),
              LabelButton(
                  label: 'Breed:',
                  value: breed,
                  leadingIcon: Icons.phone,
                  trailingIcon: Icons.edit,
                  onPressed: () {
                     updatePetName(context, user.uid, 'breed',
                      petID, breed, "Enter new pet name");
                  }),
              LabelButton(
                  label: 'Color:',
                  value: color,
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.edit,
                  onPressed: () {
                    updatePetName(context, user.uid, 'color',
                      petID, color, "Enter new pet name");
                  }),
              LabelButton(
                  label: 'Weight:',
                  value: weight,
                  leadingIcon: Icons.mail,
                  trailingIcon: Icons.edit,
                  onPressed: () {
                    updatePetName(context, user.uid, 'weight',
                      petID, weight, "Enter new pet name");
                  }),
              LabelButton(
                  label: 'Age:',
                  value: age,
                  leadingIcon: Icons.mail,
                  trailingIcon: Icons.edit,
                  onPressed: () {
                    updatePetName(context, user.uid, 'age',
                      petID, age, "Enter new pet name");
                  }),
              // CupertinoSwitch(
              //   value: isDark,
              //   onChanged: (_) {
              //     themeProvider.read.toggle();
              //   },
              // )
            ],
          );
        });
  }
}

class LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  final IconData leadingIcon;
  final IconData? trailingIcon;

  const LabelButton(
      {super.key,
      required this.label,
      required this.value,
      this.onPressed,
      required this.leadingIcon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final iconColor = isDark ? Colors.white60 : Colors.black87;
    return ListTile(
      onTap: onPressed,
      title: Text(label),
      subtitle: Text(value),
      leading: Icon(leadingIcon),
      trailing: Icon(
        trailingIcon,
        color: onPressed != null ? iconColor : Colors.transparent,
      ),
    );
  }
}
