import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {

  Authrepository authrepository;

  SaveUserSessionUseCase(this.authrepository);

  run(AuthResponse authResponse) => authrepository.saveUserSession(authResponse);
}