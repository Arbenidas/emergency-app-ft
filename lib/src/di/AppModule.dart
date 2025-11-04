import 'package:app_emergencia/src/data/api/repository/AuthRepositoryImpl.dart';
import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  @injectable
  Authservice get authservice => Authservice();

  @injectable
  Authrepository get authRepository => Authrepositoryimpl(authservice);

  @injectable
  AuthUseCase get authUseCase =>
      AuthUseCase(login: LoginUseCase(authRepository));
}
