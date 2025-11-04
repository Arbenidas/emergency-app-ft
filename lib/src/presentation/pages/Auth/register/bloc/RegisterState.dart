import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class RegisterState extends Equatable{

  final Blocformitem name;
  final Blocformitem lastname;
  final Blocformitem email;
  final Blocformitem phone;
  final Blocformitem dui;
  final Blocformitem password;
  final Blocformitem confirmpassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  
  RegisterState({
    this.name = const Blocformitem(error: "ingresa un nombre"),
    this.lastname = const Blocformitem(error: "ingresa un apellido"),
    this.email = const Blocformitem(error: "ingresa un email"),
    this.phone = const Blocformitem(error: "ingresa un telefono"),
    this.password = const Blocformitem(error: "ingresa una contraseña"),
    this.dui = const Blocformitem(error: "ingresa un numero de Dui valido"),
    this.confirmpassword = const Blocformitem(error: "Confirma tu contraseña"),
    this.response,
    this.formKey

  });

  toUser()=> User(
   name: name.value ?? '', 
   lastname: lastname.value ?? '', 
   email: email.value ?? '', 
   phone: phone.value ?? '',
   dui: dui.value ?? '',
   password: password.value ?? ''
   );

  RegisterState copyWith({
    Blocformitem? name,
    Blocformitem? lastname,
    Blocformitem? email,
    Blocformitem? phone,
    Blocformitem? password,
    Blocformitem? dui,
    Blocformitem? confirmpassword,
    GlobalKey<FormState>? formKey, 
    Resource? response,
  }){
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dui: dui ?? this.dui,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      formKey: formKey,
      response: response

    );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    dui,
    password,
    confirmpassword,
    response
  ];
   


}