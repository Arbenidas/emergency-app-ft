import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/RegisterUseCase.dart';

class AuthUseCase {
  
LoginUseCase login;
RegisterUseCase register;

  AuthUseCase({
    required this.register,
    required this.login
  });
}