import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginState.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  AuthUseCase authUseCase;
  final formKey = GlobalKey<FormState>();

  
  LoginBloc(this.authUseCase): super(LoginState()) {

    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      // event.email  LO QUE EL USUARIO ESTA ESCRIBIENDO
      emit(
        state.copyWith(
          email: Blocformitem(
            value: event.email.value,
            error: event.email.value!.isEmpty ?'Ingresa el email' : null
          ),
          formKey: formKey
        )
      );
    });

    on<passwordChange>((event, emit) {
      emit(
        state.copyWith(
          password: Blocformitem(
            value: event.password.value,
            error: 
              event.password.value!.isEmpty 
              ? 'Ingresa el password' 
              : event.password.value!.length < 6
                ? 'Minimo 6 caracteres'
                : null
          ),
          formKey: formKey
        )
      );
    });

    on<FormSubmit>((event, emit) async {
      print('Email: ${ state.email.value }');
      print('Password: ${ state.password.value }');
      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey
        )
      );
      Resource response = await authUseCase.login.run(state.email.value!, state.password.value!);
      emit(
        state.copyWith(
          response: response,
          formKey: formKey
        )
      );
    });

  }

}