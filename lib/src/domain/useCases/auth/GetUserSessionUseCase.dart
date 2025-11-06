import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {

  Authrepository authrepository;

  GetUserSessionUseCase(this.authrepository);

  run()=> authrepository.getUserSession();
}