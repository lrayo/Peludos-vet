// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:peludos_pet/app/domain/responses/reset_password_response.dart';
import 'package:peludos_pet/app/domain/responses/sing_in_response.dart';

abstract class AuthRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SingInResponse> signInWithEmailAndPassword(
    String email, 
    String password
  );

  Future<ResetPasswordResponse> sendRestPasswordLink(String email);
}


