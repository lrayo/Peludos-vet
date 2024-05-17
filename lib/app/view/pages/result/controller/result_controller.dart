// ignore_for_file: use_build_context_synchronously


import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/inputs/result_data.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';
import 'package:peludos_pet/app/domain/responses/user_response.dart';
import 'package:peludos_pet/app/view/pages/result/result_state.dart';

final logger = Logger();

class ResultController extends StateNotifier<ResultState> {
  ResultController(super.initialState);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserRepository _userRepository = Get.find<UserRepository>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String? petId;
  File? pdfFile;
  
  Future<UserResponse> sutmit() {
    return _userRepository.addresult(
        userId,
        petId!,
        ResultData(
            resultDate: state.resultDate,
            pdfURL: state.pdfURL,
            examName: state.examName));
  }

  void setPetId(String id) {
    petId = id; // Asignar el petId
  }

  void setExamName(String value) {
    state = state.copyWith(examName: value);
  }

  void setPdfURL(String value) {
    state = state.copyWith(pdfURL: value);
  }

  void setResultDate(DateTime value) {
    state = state.copyWith(resultDate: value);
  }

  void setPdfFile(File file) {
    pdfFile = file;
  }

  Future<void> uploadPDF(BuildContext context, XFile pdfFile) async {
    try {
      
      String? url = await _userRepository.uploadPDF(userId, petId!, pdfFile);
      if (url != null) {
        setPdfURL(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error uploading PDF'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      logger.e('Error uploading PDF', error: e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error uploading PDF'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
