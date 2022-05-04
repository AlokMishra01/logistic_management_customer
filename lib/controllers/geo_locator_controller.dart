import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'connectivity_controller.dart';

class GeoLocatorController with ChangeNotifier {
  final ConnectivityController? _connectivityController;

  late StreamSubscription<Position> _locationSubscription;
  LatLng? _location;

  GeoLocatorController(this._connectivityController) {
    _checkPermission();
  }

  _checkPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (!status.isGranted) {
      PermissionStatus s = await Permission.location.request();
      log(s.name, name: 'Location Permission');
    }
    if (_connectivityController != null) {
      _locationSubscription = Geolocator.getPositionStream(
        locationSettings: _locationSettings,
      ).listen(
        (position) {
          log('Position: ${position.latitude},${position.longitude}');
          _location = LatLng(position.latitude, position.longitude);
        },
      );
    }
  }

  final LocationSettings _locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    // timeLimit: Duration(seconds: 5),
  );

  @override
  void dispose() {
    try {
      _locationSubscription.cancel();
    } catch (e) {}
    super.dispose();
  }

  LatLng? get location => _location;
}
