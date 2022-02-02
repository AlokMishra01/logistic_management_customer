import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart' as colors;
import '../../constants/values.dart' as values;
import '../controllers/geo_locator_controller.dart';
import '../utils/get_address.dart';
import '../widgets/header.dart';

class RequestLocationPicker extends StatefulWidget {
  final LatLng selectedLocation;
  final void Function(LatLng position) onSelect;
  final void Function(String address) onAddress;

  const RequestLocationPicker({
    Key? key,
    required this.selectedLocation,
    required this.onSelect,
    required this.onAddress,
  }) : super(key: key);

  @override
  _RequestLocationPickerState createState() => _RequestLocationPickerState();
}

class _RequestLocationPickerState extends State<RequestLocationPicker> {
  final Completer<GoogleMapController> _mapCompleter = Completer();
  late GoogleMapController _map;
  bool _loading = true;
  String _address = '';
  LatLng? _position;
  bool _picking = false;
  BitmapDescriptor? customIcon;

  @override
  void initState() {
    super.initState();
    getAddress(
      widget.selectedLocation,
    ).then((value) {
      _address = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _map.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final location = context.watch<GeoLocatorController>();
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: _picking ? 0.0 : (76.0 / sizes.height) * sizes.height,
        ),
        child: FloatingActionButton(
          onPressed: () {
            if (location.location != null) {
              _onCameraUpdate(
                LatLng(
                  location.location!.latitude,
                  location.location!.longitude,
                ),
              );
            }
          },
          child: const Icon(
            Icons.my_location,
            color: colors.TEXT_WHITE,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Pick Location',
              backButton: true,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        widget.selectedLocation.latitude,
                        widget.selectedLocation.longitude,
                      ),
                      zoom: 18,
                    ),
                    minMaxZoomPreference: const MinMaxZoomPreference(06, 20),
                    rotateGesturesEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    mapToolbarEnabled: false,
                    zoomGesturesEnabled: true,
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    onCameraMoveStarted: _onCameraMoveStarted,
                    onCameraMove: _onCameraMove,
                    onCameraIdle: _onCameraIdle,
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    bottom: _picking
                        ? sizes.width * 0.1 + values.BASE_PADDING
                        : sizes.width * 0.1,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/map_pin.png',
                          height: sizes.width * 0.1,
                          width: sizes.width * 0.1,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 2.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          color: colors.BUTTON_BLUE,
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_picking,
                    child: DraggableScrollableSheet(
                      initialChildSize: 88.0 / sizes.height,
                      minChildSize: 88.0 / sizes.height,
                      expand: true,
                      builder: (cxt, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: colors.BUTTON_BLUE,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(values.RADIUS),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colors.BUTTON_BLUE.withOpacity(0.6),
                                offset: const Offset(3, 2),
                                blurRadius: values.RADIUS,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  CupertinoIcons.location,
                                  color: colors.TEXT_WHITE,
                                  size: 24.0,
                                ),
                                title: Text(
                                  _loading ? 'Loading Address...' : _address,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: colors.TEXT_WHITE,
                                    fontWeight: FontWeight.w600,
                                    fontSize: values.DETAILS_TEXT,
                                    height: 1.25,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: values.BASE_PADDING,
                                  horizontal: values.BASE_PADDING,
                                ),
                                trailing: OutlinedButton(
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(
                                      color: colors.TEXT_WHITE,
                                      fontWeight: FontWeight.w600,
                                      fontSize: values.DETAILS_TEXT,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: colors.TEXT_WHITE,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_position != null &&
                                        _address.isNotEmpty) {
                                      log(
                                        _position!.latitude.toString(),
                                        name: 'LOC',
                                      );
                                      log(
                                        _position!.longitude.toString(),
                                        name: 'LOC',
                                      );
                                      widget.onSelect(_position!);
                                      widget.onAddress(_address);
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                visualDensity: VisualDensity.compact,
                                horizontalTitleGap: values.BASE_PADDING,
                                minLeadingWidth: values.BASE_PADDING / 4,
                                dense: true,
                              ),
                            ],
                          ),
                        );
                      },
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

  _onMapCreated(GoogleMapController controller) {
    _map = controller;
    _mapCompleter.complete(controller);
  }

  _onCameraMoveStarted() {
    _loading = true;
    _picking = true;
    setState(() {});
  }

  _onCameraMove(CameraPosition pos) {
    _position = pos.target;
  }

  _onCameraIdle() async {
    _picking = false;
    setState(() {});
    _getAddress();
  }

  _getAddress() async {
    if (_position != null) {
      _address = await getAddress(_position!);
      _loading = false;
      setState(() {});
    }
  }

  _onCameraUpdate(LatLng pos) async {
    _map.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pos,
          zoom: 18,
        ),
      ),
    );
  }
}
