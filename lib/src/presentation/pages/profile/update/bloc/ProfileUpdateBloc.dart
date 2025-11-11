import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent,ProfileUpdateState> {
final formKey = GlobalKey<FormState>();

ProfileUpdateBloc(): super(ProfileUpdateState()){
  on<ProfileUpdateEvent>((event, emit) {
      emit(
        state.copyWith(
          name: Blocformitem(value: event.user?.name ?? ''),
          lastname: Blocformitem(value: event.)
        )
      );
  });
}

  
}