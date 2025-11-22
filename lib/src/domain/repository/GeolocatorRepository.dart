import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GeolocatoRepository {

  Future<Position> findPosition();
  Future<BitmapDescriptor> createMarkerFromAsset(String path);
  Marker getMarker(
      String markerId,
      double lat,
      double lng,
      String tittle,
      String content,
      BitmapDescriptor imageMarker
      );
}