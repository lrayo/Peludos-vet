

// ignore_for_file: constant_identifier_names

enum ResetPasswordResponse {
  ok,
  NetworkRequestFailed,
  UserDisabled,
  UserNotFound,
  tooManyRequests,
  Unknown,
} 

ResetPasswordResponse stringToResetPasswordResponse(String code) {
  switch (code) {
    case 'network-request-failed':
      return ResetPasswordResponse.NetworkRequestFailed;
    case 'user-disabled':
      return ResetPasswordResponse.UserDisabled;
    case 'user-not-found':
      return ResetPasswordResponse.UserNotFound;
    case 'internal-error':
      return ResetPasswordResponse.tooManyRequests;
    default:
      return ResetPasswordResponse.Unknown;
  }
}