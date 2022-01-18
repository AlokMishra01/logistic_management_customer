import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic_management_customer/constants/enums.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/models/package_type_model.dart';
import 'package:logistic_management_customer/utils/string_time_to_time_of_day.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/custom_time_picker.dart';
import 'package:logistic_management_customer/widgets/dialogs/bottom_dialog.dart';
import 'package:logistic_management_customer/widgets/dialogs/loading_dialog.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/delivery_form_step.dart';
import '../widgets/header.dart';
import 'delivery_form_four.dart';
import 'delivery_form_one.dart';
import 'delivery_form_three.dart';
import 'delivery_form_two.dart';
import 'main_page.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({Key? key}) : super(key: key);

  @override
  _DeliveryFormState createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  final PageController _pageController = PageController();
  int _page = 0;

  final TextEditingController _senderName = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _address = TextEditingController();
  double? _lat;
  double? _long;
  final Completer<GoogleMapController> _mapController = Completer();

  PackageTypeModel? _type;
  final TextEditingController _description = TextEditingController();
  bool _fragile = false;
  bool _express = false;
  final TextEditingController _height = TextEditingController();
  final TextEditingController _length = TextEditingController();
  final TextEditingController _width = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  final TextEditingController _pickupDate = TextEditingController();
  final TextEditingController _pickupTime = TextEditingController();
  final TextEditingController _deliveryTime = TextEditingController();

  final TextEditingController _nameDrop = TextEditingController();
  final TextEditingController _mobileDrop = TextEditingController();
  final TextEditingController _addressDrop = TextEditingController();
  double? _latDrop;
  double? _longDrop;
  final Completer<GoogleMapController> _mapControllerDrop = Completer();

  CameraPosition? _pos;

  @override
  void dispose() {
    _senderName.dispose();
    _mobile.dispose();
    _address.dispose();
    _description.dispose();
    _height.dispose();
    _length.dispose();
    _width.dispose();
    _weight.dispose();
    _pickupDate.dispose();
    _pickupTime.dispose();
    _deliveryTime.dispose();
    _nameDrop.dispose();
    _mobileDrop.dispose();
    _addressDrop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _buildPages = [
      DeliveryFormOne(
        name: _senderName,
        mobile: _mobile,
        address: _address,
        mapController: _mapController,
        lat: _lat ?? 27.68830,
        long: _long ?? 85.33556,
        onCameraMove: (p) {
          _pos = p;
        },
        onSelect: () {
          if (_pos != null) {
            _lat = _pos!.target.latitude;
            _long = _pos!.target.latitude;
            Navigator.pop(context);
            setState(() {});
          }
        },
        onNext: () => _nextPage(_page),
      ),
      DeliveryFormTwo(
        type: _type,
        onChanged: (type) {
          _type = type;
          setState(() {});
        },
        description: _description,
        fragile: _fragile,
        onChangedFragile: (value) {
          _fragile = value ?? false;
          setState(() {});
        },
        express: _express,
        onChangedExpress: (value) {
          _express = value ?? false;
          setState(() {});
        },
        height: _height,
        length: _length,
        width: _width,
        weight: _weight,
        onPre: _prePage,
        onNext: () => _nextPage(_page),
      ),
      DeliveryFormThree(
        // pickupDate: _pickupDate,
        pickupTime: _pickupTime,
        deliveryTime: _deliveryTime,
        // onPickUpTab: () async {
        //   String? d = await customDatePicker(
        //     context: context,
        //     date: _pickupDate.text.isEmpty
        //         ? DateTime.now()
        //         : DateTime.parse(_pickupDate.text),
        //   );
        //   if (d != null) _pickupDate.text = d;
        //   setState(() {});
        // },
        onPickUpTimeTab: () async {
          String? d = await customTimePicker(
            context: context,
            time: _pickupTime.text.isEmpty
                ? TimeOfDay.now()
                : stringTimeToTimeOfDay(time: _pickupTime.text),
          );
          if (d != null) _pickupTime.text = d;
          setState(() {});
        },
        onDeliveryTimeTab: () async {
          String? d = await customTimePicker(
            context: context,
            time: _deliveryTime.text.isEmpty
                ? TimeOfDay.now()
                : stringTimeToTimeOfDay(time: _deliveryTime.text),
          );
          if (d != null) _deliveryTime.text = d;
          setState(() {});
        },
        onPre: _prePage,
        onNext: () => _nextPage(_page),
      ),
      DeliveryFormFour(
        name: _nameDrop,
        mobile: _mobileDrop,
        address: _addressDrop,
        mapController: _mapControllerDrop,
        lat: _latDrop ?? 27.68830,
        long: _longDrop ?? 85.33556,
        onCameraMove: (p) {
          _pos = p;
        },
        onSelect: () {
          if (_pos != null) {
            _latDrop = _pos!.target.latitude;
            _longDrop = _pos!.target.latitude;
            Navigator.pop(context);
            setState(() {});
          }
        },
        onPre: _prePage,
        onNext: () => _nextPage(_page),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(title: 'Delivery'),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'Please fill up the form to request '
                'for pickup or delivery.',
                style: TextStyle(
                  fontSize: values.DETAILS_TEXT,
                  color: colors.TEXT_SECONDARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DeliveryFormStep(
              position: _page,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (_, i) {
                  return _buildPages[i];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _prePage() {
    if (_pageController.page!.toInt() > 0) {
      _page = _pageController.page!.toInt() - 1;
      setState(() {});
      _pageController.animateToPage(
        _pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  _nextPage(int index) {
    if (index == 0) {
      if (_senderName.text.length < 2) return;
      if (_mobile.text.isEmpty) return;
      if (_address.text.length < 2) return;
      if (_lat == null) return;
      if (_long == null) return;
      _toNextPage();
    } else if (index == 1) {
      if (_type == null) return;
      // if (_height.text.isEmpty) return;
      // if (_length.text.isEmpty) return;
      // if (_width.text.isEmpty) return;
      if (_weight.text.isEmpty) return;
      _toNextPage();
    } else if (index == 2) {
      // if (_pickupDate.text.isEmpty) return;
      if (_pickupTime.text.isEmpty) return;
      if (_deliveryTime.text.isEmpty) return;
      _toNextPage();
    } else {
      if (_nameDrop.text.length < 2) return;
      if (_mobileDrop.text.isEmpty) return;
      if (_addressDrop.text.length < 2) return;
      if (_latDrop == null) return;
      if (_longDrop == null) return;
      _requestDelivery();
    }
  }

  _toNextPage() {
    if (_pageController.page!.toInt() < 3) {
      _page = _pageController.page!.toInt() + 1;
      setState(() {});
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  _requestDelivery() async {
    FocusScope.of(context).requestFocus(FocusNode());

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    int? size;
    int? weight;
    try {
      weight = double.parse(_weight.text).round();
      size = (double.parse(_height.text) *
              double.parse(_length.text) *
              double.parse(_width.text))
          .round();
    } catch (e) {
      log(e.toString());
    }

    var result = await context.read<PackageController>().sendDeliveryRequest(
          senderName: _senderName.text,
          senderAddress: _address.text,
          senderMobileNumber: _mobile.text,
          senderLatitude: _lat ?? 0.0,
          senderLongitude: _long ?? 0.0,
          receiverName: _nameDrop.text,
          receiverAddress: _addressDrop.text,
          receiverMobileNumber: _mobileDrop.text,
          receiverLatitude: _latDrop ?? 0.0,
          receiverLongitude: _longDrop ?? 0.0,
          packageType: _type?.id ?? 0,
          packageWeight: weight ?? 0,
          packageSize: size ?? 0,
          // pickUpTime: _pickupTime.text,
          // dropOffTime: _deliveryTime.text,
          fragile: _fragile ? 1 : 0,
          // Todo: Package price from form
          packagePrice: '',
          express: _express ? 1 : 0,
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
                  builder: (_) => const MainPage(
                    index: 1,
                  ),
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
}
