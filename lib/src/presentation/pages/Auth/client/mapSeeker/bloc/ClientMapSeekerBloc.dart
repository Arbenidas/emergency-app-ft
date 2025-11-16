import 'package:app_emergencia/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class ClientMapSeekerBloc extends Bloc<CLientMapSeekerEvent,ClientMapSeekerState> {

  GeoLocatorUseCases geoLocatorUseCases;

  ClientMapSeekerBloc(this.geoLocatorUseCases): super(ClientMapSeekerState()){
    on<FindPosition>((event, emit) async {
      Position position = await geoLocatorUseCases.findPosition.run();
      emit(
        state.copyWith(position: position)
      );

    });
  } 
}