import 'package:peludos_pet/app/domain/inputs/sing_up.dart';
import 'package:peludos_pet/app/domain/responses/sing_up_response.dart';

abstract class SingUpRepository {
  Future<SingUpResponse> register(SingUpData data);
}



