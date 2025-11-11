import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInforEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/ProfileUpdateEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/ProfileUpdateState.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent,ProfileUpdateState> {
  final formkey = GlobalKey<FormState>();

ProfileUpdateBloc(): super(ProfileUpdateState()){
  on<ProfileInfoEvent>((event, emit) {
        emit(
          state.copyWith(
            name: Blocformitem(value: event.user?.name ?? ''),
            lastname: Blocformitem(value: event.user?.lastname ?? '')
          )
        );
    
  });
}

  
}