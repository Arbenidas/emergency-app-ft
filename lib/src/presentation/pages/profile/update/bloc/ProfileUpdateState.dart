import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

 class ProfileUpdateState extends Equatable{

final int id;
final Blocformitem? name;
final Blocformitem? lastname;
final Blocformitem? phone;
final GlobalKey<FormState>? formKey;
final Resource? response;


const ProfileUpdateState({
this.name = const Blocformitem(error:'Ingresa el nombre'),
this.lastname = const Blocformitem(error:'Ingresa el apellido'),
this.phone = const Blocformitem(error:'Ingresa el telefono'),
this.formKey,
this.response,
this.id = 0
});

toUser() => User(
  name: name?.value ?? '',
  lastname: lastname?.value ?? '',
  email: '',
  phone: phone?.value ?? '',
  password: '',
  dui: '');


ProfileUpdateState copyWith({
  int? id,
 Blocformitem? name,
 Blocformitem? lastname,
 Blocformitem? phone,
GlobalKey<FormState>? formKey,
Resource? response
}){
  return ProfileUpdateState(
    id: id ?? this.id,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
    formKey: formKey,
    response: response

  );
}

@override
   List<Object?> get props => [
    name,
    lastname,
    phone,
    response
  ];

}