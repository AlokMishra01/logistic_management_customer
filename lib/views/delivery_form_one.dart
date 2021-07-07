import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_input.dart';

class DeliveryFormOne extends StatelessWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController mobile;
  final TextEditingController address;
  final Completer<GoogleMapController> mapController;
  final VoidCallback onNext;

  const DeliveryFormOne({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.address,
    required this.mapController,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: values.BASE_PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sender Detail',
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            CustomInput(
              controller: firstName,
              hint: 'First Name',
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: lastName,
              hint: 'Last Name',
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: mobile,
              hint: 'Mobile Number',
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: address,
              hint: 'Address',
            ),
            SizedBox(height: values.BASE_PADDING * 2),
            Align(
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
            SizedBox(height: values.BASE_PADDING),
            SizedBox(
              height: size.width - (values.BASE_PADDING * 2),
              width: size.width - (values.BASE_PADDING * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(values.RADIUS),
                child: GoogleMap(
                  myLocationEnabled: true,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(27.68830, 85.33556),
                    zoom: 5,
                  ),
                  onMapCreated: (controller) {
                    mapController.complete(controller);
                    controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(27.68830, 85.33556),
                          zoom: 15,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            Row(
              children: [
                Expanded(child: Container()),
                TextButton(
                  onPressed: onNext,
                  child: Row(
                    children: [
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
