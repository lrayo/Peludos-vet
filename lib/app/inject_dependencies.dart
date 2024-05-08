
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:peludos_pet/app/data/repositories_impl/acount_repository_impl.dart';
import 'package:peludos_pet/app/data/repositories_impl/auth_repository_impl.dart';

import 'package:peludos_pet/app/data/repositories_impl/sing_up_repository_impl.dart';
import 'package:peludos_pet/app/data/repositories_impl/user_repository_impl.dart';
import 'package:peludos_pet/app/domain/repositories/acount_repository.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';

import 'package:peludos_pet/app/domain/repositories/sing_up_repository.dart';
import 'package:peludos_pet/app/domain/repositories/user_repository.dart';

void injectDependencies() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<SingUpRepository>(
    () => SingUpRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<AcountRepository>(
    () =>  AcountRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<UserRepository>(
    () => UserRepositoryImpl(
      FirebaseFirestore.instance,
      FirebaseStorage.instance,
    ),
  );
}
