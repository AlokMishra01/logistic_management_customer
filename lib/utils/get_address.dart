import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<String> getAddress(LatLng latLng) async {
  List<Placemark> p = await placemarkFromCoordinates(
    latLng.latitude,
    latLng.longitude,
  );

  if (p.isEmpty) {
    return 'Unknown';
  } else {
    return '${p.first.street}, ${p.first.subLocality}, '
        '${p.first.subAdministrativeArea}';
  }
}
