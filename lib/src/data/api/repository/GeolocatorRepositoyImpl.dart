import 'package:app_emergencia/src/domain/repository/GeolocatorRepository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorRepositoyImpl extends GeolocatoRepository {
  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

  @override
  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
  ImageConfiguration configuration = ImageConfiguration();
  BitmapDescriptor descriptor = await BitmapDescriptor.asset(configuration, path);
  return descriptor;
  }

  @override
  Marker getMarker(String markerId, double lat, double lng, String tittle, String content, BitmapDescriptor imageMarker) {
    MarkerId id = MarkerId(markerId);
        Marker marker = Marker(
            markerId: id,
          icon: imageMarker ,
          position: LatLng(lat, lng),
            infoWindow:  InfoWindow(title: tittle, snippet: content)
        );
        return marker;
  }

  }
