import 'package:app_emergencia/src/domain/useCases/Users/UsersUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:app_emergencia/src/injection.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInforEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) =>
        LoginBloc(locator<AuthUseCase>())..add(LoginInitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create: (context) =>
        RegisterBloc(locator<AuthUseCase>())..add(RegisterInitEvent()),
  ),
  BlocProvider<ClientHomeBloc>(
    create: (context) => ClientHomeBloc(locator<AuthUseCase>()),
  ),
  BlocProvider<ProfileInfoBloc>(
    create: (context) =>
        ProfileInfoBloc(locator<AuthUseCase>())..add(GetUserInfo()),
  ),

  BlocProvider<ProfileUpdateBloc>(
    create: (context) => ProfileUpdateBloc(locator<UserUserCases>(),locator<AuthUseCase>()),
  ),

  BlocProvider<ClientMapSeekerBloc>(create: (context) => ClientMapSeekerBloc(locator<GeoLocatorUseCases>())..add(FindPosition()))
];
