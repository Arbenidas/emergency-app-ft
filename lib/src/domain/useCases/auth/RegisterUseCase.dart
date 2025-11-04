import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {

Authrepository authrepository;

RegisterUseCase(this.authrepository);

run(User user) => authrepository.register(user);

}