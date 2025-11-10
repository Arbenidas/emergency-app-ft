import 'package:app_emergencia/src/domain/useCases/auth/AuthUseCase.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent,ClientHomeState>{

  AuthUseCase authUseCase;

  ClientHomeBloc(this.authUseCase): super(ClientHomeState()){
    
    on<ChangeDrawerPage>((event,emit){
        emit(
          state.copyWith(
            pageIndex: event.pageIndex
          )
        );
    });

    on<Logout>((event,emit)async{
        await authUseCase.logOutUseCases.run();
    });



  }


}