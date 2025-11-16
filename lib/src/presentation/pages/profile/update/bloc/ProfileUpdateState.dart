import 'dart:io';

import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final Blocformitem? name;
  final Blocformitem? lastname;
  final Blocformitem? phone;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final File? img;

  const ProfileUpdateState({
    this.name = const Blocformitem(error: 'Ingresa el nombre'),
    this.lastname = const Blocformitem(error: 'Ingresa el apellido'),
    this.phone = const Blocformitem(error: 'Ingresa el telefono'),
    this.formKey,
    this.response,
    this.id = 0,
    this.img,
  });

  toUser() => User(
    name: name?.value ?? '',
    lastname: lastname?.value ?? '',
    email: '',
    phone: phone?.value ?? '',
    password: '',
    dui: '',
    image: img ?? this.img,
  );

  ProfileUpdateState copyWith({
    int? id,
    Blocformitem? name,
    Blocformitem? lastname,
    Blocformitem? phone,
    GlobalKey<FormState>? formKey,
    Resource? response,
    File? img,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [id, name, lastname, phone, response, img];
}
