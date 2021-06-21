import 'package:flutter/material.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  // late GoogleMapController _controller;
  // Geolocator geolocator = Geolocator();
  // Position? _currentPosition;
  // CameraPosition initialCamera =
  //     CameraPosition(target: LatLng(22, 55), zoom: 20);
  // Position? destinationPosition;
  // Set<Marker> markers = {};
  // PolylinePoints? polylinePoints;
  // List<LatLng> polyLineCoordinates = [];
  // Set<Polyline> polylines = {};

  // void getCurrentPosition() async {
  //   await Geolocator.getCurrentPosition().then((position) {
  //     setState(() {
  //       _currentPosition = position;
  //
  //       initialCamera = CameraPosition(
  //           target:
  //               LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
  //           zoom: 20);
  //
  //       _controller
  //           .animateCamera(CameraUpdate.newCameraPosition(initialCamera));
  //
  //       _addMarkers(
  //           LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
  //           "Origin",
  //           BitmapDescriptor.defaultMarker);
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 538,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            // child: GoogleMap(
            //   onMapCreated: mapCreate,
            //   initialCameraPosition: initialCamera,
            //   myLocationEnabled: true,
            //   markers: Set<Marker>.of(markers),
            //   onLongPress: getDestination,
            //   polylines: Set<Polyline>.of(polylines),
            // ),
          ),
          TextButton(
              onPressed: () {
                // _createPolyLines(_currentPosition, destinationPosition);
              },
              child: Text("Find Route")),
        ],
      ),
    );
  }

  // void mapCreate(GoogleMapController controller) {
  //   _controller = controller;
  // }

  // void _addMarkers(LatLng pos, String id, BitmapDescriptor descriptor) {
  //   MarkerId markerId = MarkerId(id);
  //
  //   markers.add(Marker(
  //       markerId: markerId,
  //       position: pos,
  //       icon: descriptor,
  //       infoWindow: InfoWindow(title: id)));
  // }

  // void getDestination(LatLng argument) {
  //   if (destinationPosition != null) {
  //   } else {
  //     setState(() {
  //       destinationPosition = Position(
  //           longitude: argument.longitude,
  //           latitude: argument.latitude,
  //           accuracy: 5,
  //           speedAccuracy: 0,
  //           timestamp: DateTime.now(),
  //           heading: 0,
  //           speed: 0,
  //           altitude: 0);
  //       _addMarkers(argument, "destination",
  //           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));
  //       print(destinationPosition!.latitude);
  //     });
  //   }
  // }
  //
  // _createPolyLines(Position? start, Position? end) async {
  //   polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
  //       "AIzaSyCaxnzjztsotM_o493_qxQwqFrlLlgwuYM",
  //       PointLatLng(start!.latitude, start.longitude),
  //       PointLatLng(end!.latitude, end.longitude));
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //
  //     print(result.points[0]);
  //   } else {
  //     print(result.errorMessage);
  //   }
  //
  //   PolylineId id = PolylineId("hello");
  //
  //   Polyline polyline = Polyline(
  //       polylineId: id,
  //       color: Colors.yellow,
  //       points: polyLineCoordinates,
  //       width: 10);
  //   polylines.add(polyline);
  // }
}
