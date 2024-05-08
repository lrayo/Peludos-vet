// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/repositories/image_repository.dart';


class ImageController extends ChangeNotifier {
  final ImageRepository imageRepository;

  ImageController(this.imageRepository);

  Future<void> selectAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery, // Cambiar a ImageSource.camera para tomar foto
    );

    if (image != null) {
      final imageUrl = await imageRepository.getImage(image); // Sube la imagen y obtiene la URL

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image uploaded. URL: $imageUrl")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image selected")),
      );
    }
  }

  Future<void> uploadFromCamera() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Sube la imagen a Firebase Storage y actualiza la URL en el estado
    }
  }
}
