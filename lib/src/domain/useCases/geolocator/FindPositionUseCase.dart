import 'package:app_emergencia/src/domain/repository/GeolocatorRepository.dart';
import 'package:geolocator/geolocator.dart';

class FindPositionUseCase{

  GeolocatoRepository geolocatorRepository;

  FindPositionUseCase(this.geolocatorRepository);

  run() => geolocatorRepository.findPosition();
}