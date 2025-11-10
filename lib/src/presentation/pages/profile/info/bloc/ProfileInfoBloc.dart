import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInforEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent,ProfileInfoState>{

AuthUseCase authUseCase;

  ProfileInfoBloc(this.authUseCase):super(ProfileInfoState()){

    on<GetUserInfo>((event, emit) async {
        AuthResponse authResponse = await authUseCase.getUserSession.run();
        emit(
          state.copyWith(
            user: authResponse.user
          )
        );
    });

  }
}