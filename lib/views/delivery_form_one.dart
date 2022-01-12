import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic_management_customer/widgets/place_picker.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_input.dart';

class DeliveryFormOne extends StatefulWidget {
  final TextEditingController name;
  // final TextEditingController lastName;
  final TextEditingController mobile;
  final TextEditingController address;
  final Completer<GoogleMapController> mapController;
  final double lat;
  final double long;
  final CameraPositionCallback onCameraMove;
  final VoidCallback onSelect;
  final VoidCallback onNext;

  const DeliveryFormOne({
    Key? key,
    required this.name,
    // required this.lastName,
    required this.mobile,
    required this.address,
    required this.mapController,
    required this.lat,
    required this.long,
    required this.onCameraMove,
    required this.onSelect,
    required this.onNext,
  }) : super(key: key);

  @override
  State<DeliveryFormOne> createState() => _DeliveryFormOneState();
}

class _DeliveryFormOneState extends State<DeliveryFormOne> {
  late GoogleMapController _mapController;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: values.BASE_PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sender Detail',
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: widget.name,
              hint: 'Name',
            ),
            // SizedBox(height: values.BASE_PADDING / 2),
            // CustomInput(
            //   controller: lastName,
            //   hint: 'Last Name',
            // ),
            const SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: widget.mobile,
              hint: 'Mobile Number',
              type: TextInputType.phone,
              formatters: const [
                // PhoneInputFormatter(),
              ],
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: widget.address,
              hint: 'Address',
            ),
            const SizedBox(height: values.BASE_PADDING),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Select pickup location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLUE,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            SizedBox(
              height: (size.width - (values.BASE_PADDING * 2)) / 2,
              width: size.width - (values.BASE_PADDING * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(values.RADIUS),
                child: Stack(
                  children: [
                    GoogleMap(
                      myLocationEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      onTap: (_) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlacePicker(
                            initLocation: LatLng(widget.lat, widget.long),
                            onCameraMove: widget.onCameraMove,
                            onSelect: () {
                              _mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(widget.lat, widget.long),
                                    zoom: 15,
                                  ),
                                ),
                              );
                              widget.onSelect();
                            },
                          ),
                        ),
                      ),
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.lat, widget.long),
                        zoom: 5,
                      ),
                      onMapCreated: (controller) {
                        _mapController = controller;
                        controller.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(widget.lat, widget.long),
                              zoom: 15,
                            ),
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Image.asset(
                        'images/pin.png',
                        width: size.width * 0.1,
                        height: size.width * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Row(
              children: [
                Expanded(child: Container()),
                TextButton(
                  onPressed: widget.onNext,
                  child: Row(
                    children: const [
                      Text(
                        ' Next  ',
                        style: TextStyle(
                          color: colors.TEXT_WHITE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: colors.TEXT_WHITE,
                        size: values.BUTTON_TEXT,
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.BUTTON_BLUE,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
