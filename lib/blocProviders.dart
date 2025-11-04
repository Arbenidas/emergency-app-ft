
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc()..add(LoginInitEvent() )),
  BlocProvider<RegisterBloc>(create: (context)=> RegisterBloc()..add(RegisterInitEvent() )),
];