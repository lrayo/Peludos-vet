

class UserResponse {
  final UserError? error;
  final String? message;

  UserResponse(
     this.error,
    this.message,
  );
}

enum UserError {
  ok,
  networkRequestFailed, // Error de red
  permissionDenied, // Sin permiso para acceder
  userNotFound, // Usuario no encontrado
  documentNotFound, // Documento no encontrado
  tooManyRequests, // Demasiadas solicitudes
  unavailable, // Servicio no disponible
  internalError, // Error interno
  unknown, // Error desconocido
}

firebaseErrorToUserResponse(String text) {
  switch (text) {
    case 'network-request-failed':
      return UserError.networkRequestFailed;
    case 'permission-denied':
      return UserError.permissionDenied;
    case 'user-not-found':
      return UserError.userNotFound;
    case 'document-not-found':
      return UserError.documentNotFound;
    case 'too-many-requests':
      return UserError.tooManyRequests;
    case 'unavailable':
      return UserError.unavailable;
    case 'internal-error':
      return UserError.internalError;
    default:
      return UserError.unknown;
  }
}