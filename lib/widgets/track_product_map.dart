import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackProductMap extends StatefulWidget {
  const TrackProductMap({Key? key}) : super(key: key);

  @override
  _TrackProductMapState createState() => _TrackProductMapState();
}

class _TrackProductMapState extends State<TrackProductMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(27.68830, 85.33556),
        zoom: 5,
      ),
      onMapCreated: (controller) {
        _controller.complete(controller);
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(27.68830, 85.33556),
              zoom: 15,
            ),
          ),
        );
      },
    );
  }
}
