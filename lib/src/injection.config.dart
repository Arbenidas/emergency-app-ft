// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_emergencia/src/data/dataSource/local/SharePref.dart'
    as _i360;
import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart'
    as _i1011;
import 'package:app_emergencia/src/data/dataSource/remote/service/UserService.dart'
    as _i1057;
import 'package:app_emergencia/src/di/AppModule.dart' as _i273;
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart'
    as _i252;
import 'package:app_emergencia/src/domain/repository/UserRepository.dart'
    as _i251;
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart'
    as _i1063;
import 'package:app_emergencia/src/domain/useCases/Users/UsersUseCases.dart'
    as _i568;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appmodule = _$Appmodule();
    gh.factory<_i360.Sharepref>(() => appmodule.sharepref);
    gh.factoryAsync<String>(() => appmodule.token);
    gh.factory<_i1011.Authservice>(() => appmodule.authservice);
    gh.factory<_i252.Authrepository>(() => appmodule.authRepository);
    gh.factory<_i1057.UserService>(() => appmodule.userService);
    gh.factory<_i251.UserRespository>(() => appmodule.userRepository);
    gh.factory<_i568.UserUserCases>(() => appmodule.userUsecases);
    gh.factory<_i1063.AuthUseCase>(() => appmodule.authUseCase);
    return this;
  }
}

class _$Appmodule extends _i273.Appmodule {}
