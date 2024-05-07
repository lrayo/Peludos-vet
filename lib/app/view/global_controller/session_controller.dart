import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/domain/repositories/acount_repository.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _auth = Get.find<AuthRepository>();

  final _acountRepository = Get.find<AcountRepository>();

  void setUser(User? user) {
    _user = user;
    notify();
  }

  Future<User?> updateDisplayName(String value) async {
    final user = await _acountRepository.updateDisplayName(value);
    if (user != null) {
      _user = user;
      notify();
    }
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();

    _user = null;
  }
}



final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);

