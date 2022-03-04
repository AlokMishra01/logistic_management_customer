import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logistic_management_customer/controllers/general_controller.dart';
import 'package:logistic_management_customer/controllers/geo_locator_controller.dart';
import 'package:logistic_management_customer/widgets/custom_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart' as colors;
import '../constants/enums.dart';
import '../constants/values.dart' as values;
import '../controllers/package_controller.dart';
import '../models/package_type_model.dart';
import '../models/pricing_response_model.dart';
import '../utils/string_time_to_time_of_day.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_time_picker.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/header.dart';
import '../widgets/type_bar.dart';
import 'main_page.dart';
import 'request_location_picker.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  int _selected = 0;

  /// From Data
  final _fromName = TextEditingController();
  final _fromMobile = TextEditingController();
  final _fromAddress = TextEditingController();
  double? _fromLat;
  double? _fromLon;
  String? _fromDistrict;
  final _pickupTime = TextEditingController();
  final _pickupDate = TextEditingController();
  String _fromAddressString = '';

  /// To Data
  final _toName = TextEditingController();
  final _toMobile = TextEditingController();
  final _toAddress = TextEditingController();
  double? _toLat;
  double? _toLon;
  String? _toDistrict;
  final _dropOffTime = TextEditingController();
  final _dropOffDate = TextEditingController();
  String _toAddressString = '';

  /// Package Details
  PackageTypeModel? _type;
  final _packageDescription = TextEditingController();
  final _packageLength = TextEditingController();
  final _packageWidth = TextEditingController();
  final _packageHeight = TextEditingController();
  final _packageWeight = TextEditingController();
  bool _isFragile = false;

  final _deliveryPrice = TextEditingController();
  int _paymentType = 1;

  @override
  void dispose() {
    _fromName.dispose();
    _fromMobile.dispose();
    _fromAddress.dispose();
    _pickupTime.dispose();
    _pickupDate.dispose();
    _toName.dispose();
    _toMobile.dispose();
    _toAddress.dispose();
    _dropOffTime.dispose();
    _dropOffDate.dispose();
    _packageDescription.dispose();
    _packageLength.dispose();
    _packageWidth.dispose();
    _packageHeight.dispose();
    _packageWeight.dispose();
    _deliveryPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final location = context.watch<GeoLocatorController>();
    final package = context.watch<PackageController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(title: 'New Order'),

            /// Options
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.FIELD_BACKGROUND,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    TypeBar(
                      title: "Regular",
                      icon: Icons.av_timer_rounded,
                      selected: _selected == 0,
                      onTab: () {
                        _selected = 0;
                        setState(() {});
                      },
                    ),
                    TypeBar(
                      title: "Schedule",
                      icon: CupertinoIcons.calendar,
                      selected: _selected == 1,
                      onTab: () {
                        _selected = 1;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                _selected == 0
                    ? 'The deliveries and deliveries will be scheduled as soon as possible.'
                    : 'The deliveries and deliveries will be scheduled at your preferred time.',
                style: const TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_SECONDARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING),
            const Divider(
              thickness: 2,
              color: colors.FIELD_BACKGROUND,
            ),
            const SizedBox(height: values.BASE_PADDING),

            /// From
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'From',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(values.BASE_PADDING),
              padding: const EdgeInsets.all(values.BASE_PADDING),
              decoration: BoxDecoration(
                color: colors.TEXT_WHITE,
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _fromName,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter full name.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _fromMobile,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').length != 10) {
                        return 'Please enter valid mobile number.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Pickup Address',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _fromAddress,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter pickup address.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  CustomButton(
                    title: _fromAddressString.isEmpty
                        ? 'Select a Pickup Address'
                        : _fromAddressString,
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RequestLocationPicker(
                            selectedLocation: LatLng(
                              _fromLat ??
                                  location.location?.latitude ??
                                  27.6905911,
                              _fromLon ??
                                  location.location?.longitude ??
                                  85.3297026,
                            ),
                            onSelect: (latLng) {
                              _fromLat = latLng.latitude;
                              _fromLon = latLng.longitude;
                              setState(() {});
                            },
                            onAddress: (address) {
                              _fromAddressString = address;
                              setState(() {});
                              _fromDistrict =
                                  _fromAddressString.split(',').last.trim();
                              if (_fromDistrict != null &&
                                  _toDistrict != null) {
                                _getPrice();
                              }
                            },
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => PlacePicker(
                      //       initLocation: LatLng(
                      //         _fromLat ?? 0.0,
                      //         _fromLat ?? 0.0,
                      //       ),
                      //       onSelect: () {
                      //         Navigator.pop(context);
                      //         if (_tempCamPos != null) {
                      //           _fromLat = _tempCamPos?.target.latitude;
                      //           _fromLon = _tempCamPos?.target.longitude;
                      //           _tempCamPos = null;
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                  if (_selected == 1)
                    const SizedBox(height: values.BASE_PADDING),
                  if (_selected == 1)
                    const Text(
                      'Pickup Time',
                      style: TextStyle(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLACK,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (_selected == 1)
                    InkWell(
                      onTap: () async {
                        String? d = await customTimePicker(
                          context: context,
                          time: _pickupTime.text.isEmpty
                              ? TimeOfDay.now()
                              : stringTimeToTimeOfDay(time: _pickupTime.text),
                        );
                        if (d != null) _pickupTime.text = d;
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: _pickupTime,
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Please select pickup time.';
                          }
                        },
                        enabled: false,
                        decoration: const InputDecoration(
                          hintText: '- - : - -   - -',
                          suffixIcon: Icon(
                            Icons.access_time_rounded,
                            color: colors.TEXT_BLACK,
                          ),
                        ),
                      ),
                    ),
                  if (_selected == 1)
                    const SizedBox(height: values.BASE_PADDING),
                  if (_selected == 1)
                    const Text(
                      'Pickup Date',
                      style: TextStyle(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLACK,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (_selected == 1)
                    InkWell(
                      onTap: () async {
                        String? d = await customDatePicker(
                          context: context,
                          date: _pickupDate.text.isEmpty
                              ? DateTime.now()
                              : Jiffy(_pickupDate.text, "yyyy-MM-d").dateTime,
                        );
                        if (d != null) _pickupDate.text = d;
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: _pickupDate,
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Please select pickup date.';
                          }
                        },
                        enabled: false,
                        decoration: const InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          suffixIcon: Icon(
                            Icons.calendar_today_rounded,
                            color: colors.TEXT_BLACK,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const Divider(
              thickness: 2,
              color: colors.FIELD_BACKGROUND,
            ),
            const SizedBox(height: values.BASE_PADDING),

            /// To
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'To',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(values.BASE_PADDING),
              padding: const EdgeInsets.all(values.BASE_PADDING),
              decoration: BoxDecoration(
                color: colors.TEXT_WHITE,
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _toName,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter full name.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _toMobile,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').length != 10) {
                        return 'Please enter valid mobile number.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _toAddress,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter delivery address.';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  CustomButton(
                    title: _toAddressString.isEmpty
                        ? 'Select a Delivery Address'
                        : _toAddressString,
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RequestLocationPicker(
                            selectedLocation: LatLng(
                              _toLat ??
                                  location.location?.latitude ??
                                  27.6905911,
                              _toLon ??
                                  location.location?.longitude ??
                                  85.3297026,
                            ),
                            onSelect: (latLng) {
                              _toLat = latLng.latitude;
                              _toLon = latLng.longitude;
                              setState(() {});
                            },
                            onAddress: (address) {
                              _toAddressString = address;
                              setState(() {});
                              _toDistrict =
                                  _toAddressString.split(',').last.trim();
                              if (_fromDistrict != null &&
                                  _toDistrict != null) {
                                _getPrice();
                              }
                            },
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => PlacePicker(
                      //       initLocation: LatLng(
                      //         _toLat ?? 0.0,
                      //         _toLat ?? 0.0,
                      //       ),
                      //       onCameraMove: (pos) {
                      //         _tempCamPos = pos;
                      //       },
                      //       onSelect: () {
                      //         Navigator.pop(context);
                      //         if (_tempCamPos != null) {
                      //           _toLat = _tempCamPos?.target.latitude;
                      //           _toLon = _tempCamPos?.target.longitude;
                      //           _tempCamPos = null;
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                  if (_selected == 1)
                    const SizedBox(height: values.BASE_PADDING),
                  if (_selected == 1)
                    const Text(
                      'Delivery Time',
                      style: TextStyle(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLACK,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (_selected == 1)
                    InkWell(
                      onTap: () async {
                        String? d = await customTimePicker(
                          context: context,
                          time: _dropOffTime.text.isEmpty
                              ? TimeOfDay.now()
                              : stringTimeToTimeOfDay(time: _dropOffTime.text),
                        );
                        if (d != null) _dropOffTime.text = d;
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: _dropOffTime,
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Please select delivery time.';
                          }
                        },
                        enabled: false,
                        decoration: const InputDecoration(
                          hintText: '- - : - -   - -',
                          suffixIcon: Icon(
                            Icons.access_time_rounded,
                            color: colors.TEXT_BLACK,
                          ),
                        ),
                      ),
                    ),
                  if (_selected == 1)
                    const SizedBox(height: values.BASE_PADDING),
                  if (_selected == 1)
                    const Text(
                      'Delivery Date',
                      style: TextStyle(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLACK,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (_selected == 1)
                    InkWell(
                      onTap: () async {
                        String? d = await customDatePicker(
                          context: context,
                          date: _dropOffDate.text.isEmpty
                              ? DateTime.now()
                              : Jiffy(_dropOffDate.text, "yyyy-MM-d").dateTime,
                          // : stringDateToDateTime(date: _pickupDate.text),
                        );
                        log(d.toString());
                        if (d != null) _dropOffDate.text = d;
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: _dropOffDate,
                        textCapitalization: TextCapitalization.words,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Please select delivery date.';
                          }
                        },
                        enabled: false,
                        decoration: const InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          enabled: false,
                          suffixIcon: Icon(
                            Icons.calendar_today_rounded,
                            color: colors.TEXT_BLACK,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const Divider(
              thickness: 2,
              color: colors.FIELD_BACKGROUND,
            ),
            const SizedBox(height: values.BASE_PADDING),

            /// Package Details
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'Package Details',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(values.BASE_PADDING),
              padding: const EdgeInsets.all(values.BASE_PADDING),
              decoration: BoxDecoration(
                color: colors.TEXT_WHITE,
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Type of Packages',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButtonFormField<PackageTypeModel>(
                    value: _type,
                    items: package.packageTypes
                        .map(
                          (p) => DropdownMenuItem<PackageTypeModel>(
                            value: p,
                            child: Text(p.name ?? ''),
                          ),
                        )
                        .toList(),
                    decoration: const InputDecoration(
                      hintText: 'Select',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (type) {
                      _type = type;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Package Description',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _packageDescription,
                    maxLines: 5,
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Length',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _packageLength,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'Centimeter(cm)',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (int.tryParse((value ?? '0').toString()) == null) {
                        return 'Please enter valid length in Centimeter(cm).';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Width',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _packageWidth,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'Centimeter(cm)',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (int.tryParse((value ?? '0').toString()) == null) {
                        return 'Please enter valid width in Centimeter(cm).';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Height',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _packageHeight,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'Centimeter(cm)',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (int.tryParse((value ?? '0').toString()) == null) {
                        return 'Please enter valid height in Centimeter(cm).';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: _packageWeight,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: 'Kilogram(kg)',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (int.tryParse((value ?? '0').toString()) == null) {
                        return 'Please enter valid weight in Kilogram(kg).';
                      }
                    },
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  Row(
                    children: [
                      const Text(
                        'Fragile?',
                        style: TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_BLACK,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: _isFragile,
                                  onChanged: (value) {
                                    if (!_isFragile) {
                                      _isFragile = true;
                                      setState(() {});
                                    }
                                  },
                                ),
                                const Text(
                                  'YES',
                                  style: TextStyle(
                                    fontSize: values.TITLE_TEXT,
                                    color: colors.TEXT_BLACK,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: false,
                                  groupValue: _isFragile,
                                  onChanged: (value) {
                                    if (_isFragile) {
                                      _isFragile = false;
                                      setState(() {});
                                    }
                                  },
                                ),
                                const Text(
                                  'NO',
                                  style: TextStyle(
                                    fontSize: values.TITLE_TEXT,
                                    color: colors.TEXT_BLACK,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              thickness: 2,
              color: colors.FIELD_BACKGROUND,
            ),
            const SizedBox(height: values.BASE_PADDING),

            /// Payment Details
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: values.BASE_PADDING * 2),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING * 2,
              ),
              child: Text(
                'Delivery Pricing',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING * 2,
              ),
              child: TextFormField(
                controller: _deliveryPrice,
                enabled: false,
              ),
            ),

            Container(
              margin: const EdgeInsets.all(values.BASE_PADDING),
              padding: const EdgeInsets.all(values.BASE_PADDING),
              decoration: BoxDecoration(
                color: colors.TEXT_WHITE,
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      _paymentType = 1;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(values.BASE_PADDING),
                      decoration: BoxDecoration(
                        color: _paymentType != 1
                            ? colors.TEXT_WHITE
                            : colors.BUTTON_BLUE,
                        borderRadius: BorderRadius.circular(values.RADIUS),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            color: _paymentType == 1
                                ? colors.TEXT_WHITE
                                : colors.BUTTON_BLUE,
                          ),
                          Text(
                            'Cash on Pickup',
                            style: TextStyle(
                              fontSize: values.TITLE_TEXT,
                              color: _paymentType == 1
                                  ? colors.TEXT_WHITE
                                  : colors.BUTTON_BLUE,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(
              thickness: 2,
              color: colors.FIELD_BACKGROUND,
            ),
            const SizedBox(height: values.BASE_PADDING),

            /// Button
            const SizedBox(height: values.BASE_PADDING),
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: CustomButton(
                title: 'SEND ORDER REQUEST',
                onTab: _requestDelivery,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'By Clicking “Send order Request”, '
                          'you are agreeing to ',
                    ),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: GoogleFonts.comfortaa(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLUE,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          launch(
                            'https://logistics.intopros.com.np/terms-and-conditions',
                          );
                        },
                    ),
                    const TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: GoogleFonts.comfortaa(
                        fontSize: values.TITLE_TEXT,
                        color: colors.TEXT_BLUE,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          launch(
                            'https://logistics.intopros.com.np/privacy-policy',
                          );
                        },
                    ),
                    const TextSpan(
                      text: '  of LMS.',
                    ),
                  ],
                  style: GoogleFonts.comfortaa(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_SECONDARY,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  _requestDelivery() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_fromName.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter sender full name.',
      );
      return;
    }
    if (_fromMobile.text.length != 10) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter sender valid mobile number.',
      );
      return;
    }
    if (_fromAddress.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter pickup address.',
      );
      return;
    }
    if (_fromLat == null || _fromLon == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select pickup location.',
      );
      return;
    }
    if (_selected == 1 && _pickupTime.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select pickup time.',
      );
      return;
    }
    if (_selected == 1 && _pickupDate.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select pickup date.',
      );
      return;
    }

    if (_toName.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter receiver full name.',
      );
      return;
    }
    if (_toMobile.text.length != 10) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter receiver valid mobile number.',
      );
      return;
    }
    if (_toAddress.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter delivery address.',
      );
      return;
    }
    if (_toLat == null || _fromLon == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select delivery location.',
      );
      return;
    }
    if (_selected == 1 && _dropOffTime.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select delivery date.',
      );
      return;
    }
    if (_selected == 1 && _dropOffDate.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select delivery date.',
      );
      return;
    }

    if (_type == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please select package type.',
      );
      return;
    }
    if (int.tryParse((_packageLength.text).toString()) == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter valid length.',
      );
      return;
    }
    if (int.tryParse((_packageWidth.text).toString()) == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter valid width.',
      );
      return;
    }
    if (int.tryParse((_packageHeight.text).toString()) == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter valid height.',
      );
      return;
    }
    if (int.tryParse((_packageWeight.text).toString()) == null) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: 'Please enter valid weight.',
      );
      return;
    }

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    int? size;
    int? weight;
    try {
      weight = int.parse(_packageWeight.text);
      size = int.parse(_packageHeight.text) *
          int.parse(_packageLength.text) *
          int.parse(_packageWidth.text);
    } catch (e) {
      log(e.toString());
    }

    var result = await context.read<PackageController>().sendDeliveryRequest(
          senderName: _fromName.text,
          senderAddress: _fromAddress.text,
          senderMobileNumber: _fromMobile.text,
          senderLatitude: _fromLat!,
          senderLongitude: _fromLon!,
          receiverName: _toName.text,
          receiverAddress: _toAddress.text,
          receiverMobileNumber: _toMobile.text,
          receiverLatitude: _toLat!,
          receiverLongitude: _toLon!,
          packageType: _type!.id!,
          packageWeight: weight!,
          packageSize: size!,
          packageDescription: _packageDescription.text,
          pickUpTime: _selected == 0
              ? Jiffy(DateTime.now()).format("h:mm a")
              : _pickupTime.text,
          dropOffTime: _selected == 0 ? '' : _dropOffTime.text,
          pickUpDate: _selected == 0 ? '' : _pickupDate.text,
          dropOffDate: _selected == 0 ? '' : _dropOffDate.text,
          fragile: _isFragile ? 1 : 0,
          // Todo: Package price from form
          packagePrice: '',
          // express: _express ? 1 : 0,
          express: _selected == 0 ? 1 : 0,
        );

    progressDialog.dismiss();

    if (result.isEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainPage(),
                ),
                (route) => false,
              );
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.all(
                values.BASE_PADDING * 2,
              ),
              child: Center(
                child: Material(
                  color: colors.TEXT_WHITE,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      values.RADIUS / 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      values.BASE_PADDING,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: values.BASE_PADDING),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: values.BASE_PADDING * 2,
                          ),
                          child: Image.asset(
                            'images/delivered.png',
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: values.BASE_PADDING),
                        const Text(
                          'Delivery request has been sent successfully !!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.w600,
                            color: colors.TEXT_BLUE,
                          ),
                        ),
                        const SizedBox(height: values.BASE_PADDING),
                        const Text(
                          'Our customer service will contact you once your request is verified.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: values.DETAILS_TEXT,
                            color: colors.YELLOW,
                          ),
                        ),
                        const SizedBox(height: values.BASE_PADDING),
                        CustomButton(
                          title: 'Finish',
                          onTab: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainPage(
                                  index: 1,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        const SizedBox(height: values.BASE_PADDING),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      progressDialog.dismiss();
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error!',
        message: result,
      );
    }
  }

  _getPrice() async {
    _deliveryPrice.text = 'Loading Pricing...';
    PricingResponseModel? r = await context
        .read<GeneralController>()
        .getPricing(from: _fromDistrict ?? '', to: _toDistrict ?? '');

    if (r == null) {
      _deliveryPrice.text = 'Customer support will contact you';
    } else {
      _deliveryPrice.text = ((r.price ?? '0') == '0')
          ? 'Customer support will contact you'
          : 'NRs. ${r.price} Only';
    }
  }
}
