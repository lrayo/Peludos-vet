import 'package:firebase_auth/firebase_auth.dart';
import 'package:peludos_pet/app/domain/repositories/acount_repository.dart';

class AcountRepositoryImpl implements AcountRepository {
  final FirebaseAuth _auth;

  AcountRepositoryImpl(this._auth);

  @override
  Future<User?> updateDisplayName(String value) async {
    try {
      final user = _auth.currentUser!;
      await user.updateDisplayName(value);
      user.reload();
      return _auth.currentUser;
    } catch (e) {
      return null;
    }
  }
}
