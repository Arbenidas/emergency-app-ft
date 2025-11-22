import 'package:app_emergencia/src/data/api/repository/AuthRepositoryImpl.dart';
import 'package:app_emergencia/src/data/api/repository/GeolocatorRepositoyImpl.dart';
import 'package:app_emergencia/src/data/api/repository/UserRepositoryImpl.dart';
import 'package:app_emergencia/src/data/dataSource/local/SharePref.dart';
import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/data/dataSource/remote/service/UserService.dart';
import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';
import 'package:app_emergencia/src/domain/repository/GeolocatorRepository.dart';
import 'package:app_emergencia/src/domain/repository/UserRepository.dart';
import 'package:app_emergencia/src/domain/useCases/Users/UpdateUserUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/Users/UsersUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LogOutUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  @injectable
  Sharepref get sharepref => Sharepref();

  @injectable
  Future<String> get token async{
    String token = '';
    final userSession = await sharepref.read('user');
    if (userSession != null){
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token; 
    }
    return token;
  }

  @injectable
  Authservice get authservice => Authservice();

  @injectable
  Authrepository get authRepository =>
      Authrepositoryimpl(authservice, sharepref);

  @injectable
  UserService get userService => UserService(token);

  @injectable
  UserRespository get userRepository => UserRepositoryImpl(userService);

  @injectable
  GeolocatoRepository get geolocatoRepository => GeolocatorRepositoyImpl();

  @injectable
  UserUserCases get userUsecases =>UserUserCases(updateUserUseCase: UpdateUserUseCase(userRepository));

  @injectable
  AuthUseCase get authUseCase => AuthUseCase(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logOutUseCases: LogOutUseCases(authrepository: authRepository),

  );
  @injectable
  GeoLocatorUseCases get geoLocatorUseCases => GeoLocatorUseCases(
    findPosition: FindPositionUseCase(geolocatoRepository),
     getMarker: GetMakerUseCase(geolocatoRepository),
     createMarker: CreateMakerUseCases(geolocatoRepository)
    );
}
