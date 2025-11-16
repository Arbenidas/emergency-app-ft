import 'dart:io';

import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/useCases/Users/UsersUseCases.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();
  AuthUseCase authUseCase;
  UserUserCases userCases;

  ProfileUpdateBloc(this.userCases, this.authUseCase)
    : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(
        state.copyWith(
          id: event.user?.id,
          name: Blocformitem(value: event.user?.name ?? ''),
          lastname: Blocformitem(value: event.user?.lastname ?? ''),
          phone: Blocformitem(value: event.user?.phone ?? ''),
          formKey: formKey,
        ),
      );
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: Blocformitem(
            value: event.name.value,
            error: event.name.value!.isEmpty ? 'Ingresa un nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastNameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: Blocformitem(
            value: event.lastname.value,
            error: event.lastname.value!.isEmpty ? 'Ingresa un apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<Phonechanged>((event, emit) {
      emit(
        state.copyWith(
          name: Blocformitem(
            value: event.phone.value,
            error: event.phone.value!.isEmpty
                ? 'Ingrese un numero de telefono'
                : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PickImage>((event, emit) async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        state.copyWith(img: File(image.path), formKey: formKey);
      }
    });
    on<TakePhoto>((event, emit) async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        state.copyWith(img: File(image.path), formKey: formKey);
      }
    });
    on<UpdateUserSession>((event, emit) async {
      AuthResponse authResponse = await authUseCase.getUserSession.run();
      authResponse.user.name = event.user!.name;
      authResponse.user.lastname = event.user!.lastname;
      authResponse.user.phone = event.user!.phone;
      authResponse.user.image = event.user?.image;
      await authUseCase.saveUserSession.run(authResponse);
    });

    on<FormSubmit>((event, emit) async {
      print('Name: ${state.name?.value}');
      print('Lastname: ${state.lastname?.value}');
      print('phone: ${state.phone?.value}');
      emit(state.copyWith(response: Loading(), formKey: formKey));
      Resource response = await userCases.updateUserUseCase.run(
        state.id,
        state.toUser(),
        null,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
