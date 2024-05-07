import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';
import 'package:peludos_pet/app/domain/responses/reset_password_response.dart';
import 'package:peludos_pet/app/domain/responses/sing_in_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthRepositoryImpl(this._auth) {
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }


  void _init() async {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
  
  @override
  Future<SingInResponse> signInWithEmailAndPassword(String email, String password) async{
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
        final user = userCredential.user!;
        return SingInResponse(null, user);
    } on FirebaseAuthException catch (e) {
      return SingInResponse(stringToSingInError(e.code), null);
    }
  }
  
  @override
  Future<ResetPasswordResponse> sendRestPasswordLink(String email) async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ResetPasswordResponse.ok;
    } on FirebaseAuthException catch (e) {
      return stringToResetPasswordResponse(e.code);
    }
  }

}
