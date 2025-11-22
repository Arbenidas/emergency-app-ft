import 'package:app_emergencia/src/domain/repository/GeolocatorRepository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetMakerUseCase {
  GeolocatoRepository geolocatoRepository;

  GetMakerUseCase(this.geolocatoRepository);
  run(String markerId, double lat, double lng, String tittle, String content, BitmapDescriptor imageMarker) => geolocatoRepository.getMarker(markerId, lat, lng, tittle, content, imageMarker);
 
}