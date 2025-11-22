import 'package:app_emergencia/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:app_emergencia/src/domain/useCases/geolocator/GetMarkerUseCase.dart';

class GeoLocatorUseCases{

  FindPositionUseCase findPosition;
  CreateMakerUseCases createMarker;
  GetMakerUseCase getMarker;

  GeoLocatorUseCases({
    required this.findPosition,
    required this.getMarker,
    required this.createMarker
  });
}