import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterState.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {


  AuthUseCase authUseCase;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUseCase) : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith( formKey: formKey ));
    });

  on<SaveUserSession>((event, emit) async {
  await authUseCase.saveUserSession.run(event.authResponse);
});
    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: Blocformitem(
            value: event.name.value,
            error: event.name.value!.isEmpty ? 'Ingresa el nombre' : null
          ),
          formKey: formKey
        )
      );
    });

    on<LastNameChange>((event, emit) {
      emit(
        state.copyWith(
          lastname: Blocformitem(
            value: event.lastname.value,
            error: event.lastname.value!.isEmpty ? 'Ingresa el apellido' : null
          ),
          formKey: formKey
        )
      );
    });

    on<EmailChange>((event, emit) {
      emit(
        state.copyWith(
          email: Blocformitem(
            value: event.email.value,
            error: event.email.value!.isEmpty ? 'Ingresa el email' : null
          ),
          formKey: formKey
        )
      );
    });

    on<PhoneChange>((event, emit) {
      emit(
        state.copyWith(
          phone: Blocformitem(
            value: event.phone.value,
            error: event.phone.value!.isEmpty ? 'Ingresa el telefono' : null
          ),
          formKey: formKey
        )
      );
    });


    on<DuiChange>((event, emit) {
      // 1. Limpiamos el valor ANTES de validarlo
      final cleanedDui = event.dui.value!
                          .replaceAll('-', '') // Quita el guion
                          .trim();              // Quita espacios

      emit(
        state.copyWith(
          dui: Blocformitem( // <--- ¡CORREGIDO!
            value: event.dui.value, // Dejamos el valor original (con guion) en el campo
            error: cleanedDui.isEmpty 
              ? 'Ingresa el dui' 
              : cleanedDui.length != 9  // <--- ¡LÓGICA CORREGIDA!
                ? 'El DUI debe tener 9 digitos' // <--- Mensaje de tu imagen
                : null
          ),
          formKey: formKey
        )
      );
    });
// ...

    on<PasswordChange>((event, emit) {
      emit(
        state.copyWith(
          password: Blocformitem(
            value: event.password.value,
            error: event.password.value!.isEmpty 
              ? 'Ingresa el Password' 
              : event.password.value!.length < 6 
                ? 'Mas de 6 caracteres' 
                : null
          ),
          formKey: formKey
        )
      );
    });

    on<ConfirmPasswordChange>((event, emit) {
      emit(
        state.copyWith(
          confirmpassword: Blocformitem(
            value: event.confirmpassword.value,
            error: event.confirmpassword.value!.isEmpty 
              ? 'Confirma el password' 
              : event.confirmpassword.value!.length < 6 
                ? 'Mas de 6 caracteres' 
                : event.confirmpassword.value != state.password.value 
                  ? 'Los password no coinciden'
                  : null
          ),
          formKey: formKey
        )
      );
    });

    on<FormSubmit>((event, emit) async {
      print('Name: ${state.name.value}');
      print('LastName: ${state.lastname.value}');
      print('email: ${state.email.value}');
      print('phone: ${state.phone.value}');
      print('password: ${state.password.value}');
      print('confirmPassword: ${state.confirmpassword}');
      print('dui ${state.dui}');
      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey
        )
      );
      Resource response = await  authUseCase.register.run(state.toUser());
      emit(
        state.copyWith(
          response: response,
          formKey: formKey
        )
      );
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}