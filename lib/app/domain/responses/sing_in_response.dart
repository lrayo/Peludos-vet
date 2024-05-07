

// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

class SingInResponse {
  final SingInError? error;
  final User? user;

  SingInResponse( this.error, this.user);
}

enum SingInError {
  tooManyRequests,
  NetworkRequestFailed,
  UserDisabled,
  UserNotFound,
  WrongPassword,
  Unknown,
}

SingInError stringToSingInError(String code) {
  switch (code) {
    case 'user-disabled':
      return SingInError.UserDisabled;
    case 'user-not-found':
      return SingInError.UserNotFound;
    case 'wrong-password':
      return SingInError.WrongPassword;
    case 'network-request-failed':
      return SingInError.NetworkRequestFailed;
    case 'too-Many-Requests':
      return SingInError.tooManyRequests;
    default:
      return SingInError.Unknown;
  }
}