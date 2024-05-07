

// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

class SingUpResponse {
  final SingUpError? error;
  final User? user;

  SingUpResponse(this.error, this.user);
  
}

parseStringToSingUpError(String text) {
  switch (text) {
    case 'email-already-in-use':
      return SingUpError.emailAlreadyInUse;
    case 'weak-password':
      return SingUpError.weakPassword;
    case 'network-request-failed':
      return SingUpError.NetworkRequestFailed;
    case 'too-many-requests':
      return SingUpError.tooManyRequests;
    default:
      return SingUpError.unknown;
  }
}

enum SingUpError {
  emailAlreadyInUse,
  weakPassword,
  unknown,
  NetworkRequestFailed,
  tooManyRequests
}