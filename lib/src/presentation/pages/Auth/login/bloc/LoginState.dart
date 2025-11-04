import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends Equatable {

  final Blocformitem email;
  final Blocformitem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const LoginState({
    this.email = const Blocformitem(error: "Ingresa el email"),
    this.password = const Blocformitem(error: "Ingresa una contraseña"),
    this.response,
    this.formKey,
  });


  LoginState copyWith({
      final Resource? response,
    GlobalKey<FormState>? formKey,
    Blocformitem? email,
    Blocformitem? password
  }){
    return LoginState(
      response: response,
      email: email ?? this.email,
      password:  password ?? this.password,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props =>[
    email,
    password,
    response
  ];
} 