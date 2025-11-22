import 'package:app_emergencia/src/domain/repository/GeolocatorRepository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateMakerUseCases{
  GeolocatoRepository geolocatoRepository;
  CreateMakerUseCases(this.geolocatoRepository);

  run(String path)=> geolocatoRepository.createMarkerFromAsset(path);

}