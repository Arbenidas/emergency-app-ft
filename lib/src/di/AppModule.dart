import 'package:app_emergencia/src/data/api/repository/AuthRepositoryImpl.dart';
import 'package:app_emergencia/src/data/dataSource/local/SharePref.dart';
import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {

  @injectable
  Sharepref get sharepref =>Sharepref();

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  Authrepository get authRepository => Authrepositoryimpl(authservice, sharepref);

  @injectable
  AuthUseCase get authUseCase =>
      AuthUseCase(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        );
}
