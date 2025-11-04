import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class RegisterState extends Equatable{

  final Blocformitem name;
  final Blocformitem lastname;
  final Blocformitem email;
  final Blocformitem phone;
  final Blocformitem password;
  final Blocformitem confirmpassword;
  final GlobalKey<FormState>? formKey;

  
  RegisterState({
    this.name = const Blocformitem(error: "ingresa un nombre"),
    this.lastname = const Blocformitem(error: "ingresa un apellido"),
    this.email = const Blocformitem(error: "ingresa un email"),
    this.phone = const Blocformitem(error: "ingresa un telefono"),
    this.password = const Blocformitem(error: "ingresa una contraseña"),
    this.confirmpassword = const Blocformitem(error: "Confirma tu contraseña"),
    this.formKey

  });

  RegisterState copyWith({
    Blocformitem? name,
    Blocformitem? lastname,
    Blocformitem? email,
    Blocformitem? phone,
    Blocformitem? password,
    Blocformitem? confirmpassword,
    GlobalKey<FormState>? formKey,
  }){
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      formKey: formKey

    );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmpassword
  ];
   


}