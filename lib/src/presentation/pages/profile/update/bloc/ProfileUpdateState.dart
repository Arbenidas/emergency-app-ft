import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

 class ProfileUpdateState extends Equatable{

final Blocformitem? name;
final Blocformitem? lastname;
final Blocformitem? phone;
final GlobalKey<FormState>? formKey;


const ProfileUpdateState({
this.name = const Blocformitem(error:'Ingresa el nombre'),
this.lastname = const Blocformitem(error:'Ingresa el apellido'),
this.phone = const Blocformitem(error:'Ingresa el telefono'),
this.formKey 

});

ProfileUpdateState copyWith({
 Blocformitem? name,
 Blocformitem? lastname,
 Blocformitem? phone,
GlobalKey<FormState>? formKey
}){
  return ProfileUpdateState(
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
    formKey: formKey
  );
}

@override
   List<Object?> get props => [
    name,
    lastname,
    phone,
  ];

}