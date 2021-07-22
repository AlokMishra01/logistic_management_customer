import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic_management_customer/constants/values.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/header.dart';

class PlacePicker extends StatefulWidget {
  final LatLng initLocation;
  final CameraPositionCallback onCameraMove;
  final VoidCallback onSelect;

  const PlacePicker({
    Key? key,
    required this.initLocation,
    required this.onCameraMove,
    required this.onSelect,
  }) : super(key: key);

  @override
  _PlacePickerState createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Header(
                title: 'Pick Location',
                backButton: true,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: widget.initLocation,
                      zoom: 5,
                    ),
                    onMapCreated: (controller) {
                      mapController.complete(controller);
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: widget.initLocation,
                            zoom: 15,
                          ),
                        ),
                      );
                    },
                    onCameraMove: widget.onCameraMove,
                  ),
                  Center(
                    child: Image.asset(
                      'images/pin.png',
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                    ),
                  ),
                  Positioned(
                    bottom: BASE_PADDING,
                    left: BASE_PADDING,
                    right: BASE_PADDING,
                    child: CustomButton(
                      title: 'SELECT',
                      onTab: widget.onSelect,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
