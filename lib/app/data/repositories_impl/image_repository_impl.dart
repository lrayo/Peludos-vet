import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peludos_pet/app/domain/repositories/image_repository.dart';

class ImageRepositoryImpl extends ImageRepository {
  final FirebaseStorage storage;

  ImageRepositoryImpl(this.storage);
  @override
  Future<String> getImage( XFile image) async {
    try {
      final filePath =
          'images/${DateTime.now().millisecondsSinceEpoch}.jpg'; // Ruta única para la imagen
      final ref =
          storage.ref().child(filePath); // Referencia al archivo en Storage

      final uploadTask =
          ref.putFile(File(image.path)); // Sube el archivo a Storage
      await uploadTask
          .whenComplete(() => null); // Esperar a que termine la subida

      return await ref.getDownloadURL(); // Devuelve la URL de la imagen subida
    } catch (e) {
      print("Error uploading image: $e");
      return '"Error uploading image: $e"'; // Retorna null si hay un error
    }
  }
}
