import 'package:app_emergencia/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LogOutUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUseCase {
  
LoginUseCase login;
RegisterUseCase register;
SaveUserSessionUseCase saveUserSession;
GetUserSessionUseCase getUserSession;
LogOutUseCases logOutUseCases;

  AuthUseCase({
    required this.register,
    required this.login,
    required this.getUserSession,
    required this.saveUserSession,
    required this.logOutUseCases
  });
}