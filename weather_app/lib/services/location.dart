import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double? latitude;
  double? longitude;
  Position? position;

  Future<void> getCurrentLocation() async {
    try {
      Position newPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      position = newPosition;

      latitude = position?.latitude;
      longitude = position?.longitude;
    } catch (e) {
      print(e);
    }
  }
}
