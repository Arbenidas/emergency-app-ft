import 'package:geolocator/geolocator.dart';

abstract class GeolocatoRepository {

  Future<Position> findPosition();
}