

import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final deviceLocationProvider = FutureProvider<LatLng?>((ref) async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;


  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return Future.error("service not enabled");
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return Future.error("permission not granted");
    }
  }

  final LocationData = await location.getLocation();
  return Future.value(LatLng(LocationData.latitude!, LocationData.longitude!));
});

