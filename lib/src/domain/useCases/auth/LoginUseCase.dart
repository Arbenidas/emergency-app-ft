import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';

class LoginUseCase {

  Authrepository repositoy;

  LoginUseCase(this.repositoy);
  
  run(String email,String password)=> repositoy.login(email, password);
}