// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/global_controller/theme_controller.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/dialogs.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/progress_dialog.dart';
import 'package:peludos_pet/app/view/global_widget/dialogs/show_input_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: const Center(
        child: Progfile(),
      ),
    );
  }
}

class Progfile extends ConsumerWidget {
  const Progfile({super.key});

  void _updateDisplayName(BuildContext context) async {
    final sessionController = sessionProvider.read;
    final value = await showInputDialog(context);
    if (value != null) {
      ProgressDialog.show(context);
      final user = await sessionController.updateDisplayName(value);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(context,
            title: "Error", content: "Check your connection");
      }
    }
  }

  Future<void> _updatePhoneNumber(BuildContext context, String userId) async {
    try {
      final String? value = await showInputDialog(context,title: "Enter new phone number");

      if (value != null && value.isNotEmpty) {
        // Actualizar el campo "phone" en Firestore
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .update({
          "phone": value, // Usa el valor ingresado
        });
      } 
    } catch (e) {
      Dialogs.alert(context,
            title: "Error", content: "Phone number cannot be empty");
    }
  }


  Future<void> _updateAddress(BuildContext context, String userId) async {
    try {
      final value = await showInputDialog(context);

      if (value != null && value.isNotEmpty) {
        // Actualizar el campo "phone" en Firestore
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .update({
          "address": value, // Usa el valor ingresado
        });

        // Mostrar confirmación de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Address updated")),
        );
      } 
    } catch (e) {
      if (e == null) {
        Dialogs.alert(context,
            title: "Error", content: "Address cannot be empty");
      }
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final isDark = context.isDarkMode;
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    final letter = user.displayName!.isNotEmpty ? user.displayName![0] : '';

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
          final phone = userDoc['phone'] ?? 'No phone'; // Recuperar teléfono
          final address =
              userDoc['address'] ?? 'No address'; // Recuperar dirección

          // Pasar información al Progfile
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    user.photoURL != null && user.photoURL!.isNotEmpty
                        ? NetworkImage(user.photoURL!)
                        : null,
                child: user.photoURL == null || user.photoURL!.isEmpty
                    ? Text(
                        letter,
                        style: const TextStyle(fontSize: 65.0),
                      )
                    : null,
              ),
              const SizedBox(height: 20.0),
              Center(
                  child: Text('${user.displayName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0))),
              Center(
                  child: Text('${user.email}',
                      style: const TextStyle(fontSize: 18.0))),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              const Text('Contact Information',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              LabelButton(
                label: 'Name:',
                value: user.displayName!,
                leadingIcon: Icons.person,
                trailingIcon: Icons.edit,
                onPressed: () => _updateDisplayName(context),
              ),
              LabelButton(
                  label: 'PhoneNumber:',
                  value: phone,
                  leadingIcon: Icons.phone,
                  trailingIcon: Icons.edit,
                  onPressed: () => _updatePhoneNumber(context, user.uid)),
              LabelButton(
                  label: 'Address:',
                  value: address,
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.edit,
                  onPressed: () => _updateAddress(context, user.uid)),
              LabelButton(
                  label: 'E-mail:',
                  value: '${user.email}',
                  leadingIcon: Icons.mail),
              LabelButton(
                  label: 'E-mail verified:',
                  value: user.emailVerified ? "Yes" : 'No',
                  leadingIcon: Icons.mail),
              CupertinoSwitch(
                value: isDark,
                onChanged: (_) {
                  themeProvider.read.toggle();
                },
              )
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

