import 'dart:async';

import 'package:app_emergencia/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/bloc/ClientMapSeekerState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapSeekerBloc extends Bloc<CLientMapSeekerEvent,ClientMapSeekerState> {

  GeoLocatorUseCases geoLocatorUseCases;
  Completer<GoogleMapController>? controller = Completer<GoogleMapController>();

  ClientMapSeekerBloc(this.geoLocatorUseCases): super(ClientMapSeekerState()){

    on<ClientMapSeekerInitEvent>((event, emit) {
      emit(
        state.copyWith(
          controller: controller
        )
      ); 
        });

    

    on<FindPosition>((event, emit) async {
      Position position = await geoLocatorUseCases.findPosition.run();
      
      add(ChangeMapCameraPosition(lat: position.latitude, lng: position.longitude));
      BitmapDescriptor imageMarker = await geoLocatorUseCases.createMarker.run('assets/img/blue.png');
      Marker marker = geoLocatorUseCases.getMarker.run(
        'my location',
        position.latitude,
        position.altitude,
        'My position',
        '',
        imageMarker

      );
      emit (state.copyWith(
        markers: {
          marker.markerId: marker,
          
        },
        position: position,
        controller: controller
      )
      );

    });


    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.lat, event.lng),
          zoom: 13,
          bearing: 0)));
      emit(
          state.copyWith(
              controller: controller
          )
      );
    });
  } 
  
}