import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logistic_management_customer/constants/enums.dart';
import 'package:logistic_management_customer/providers/authentication.dart';
import 'package:logistic_management_customer/providers/delivery_provider.dart';
import 'package:logistic_management_customer/providers/request_provider.dart';
import 'package:logistic_management_customer/utils/string_time_to_time_of_day.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/custom_date_picker.dart';
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
  PageController _pageController = PageController();
  int _page = 0;

  TextEditingController _senderName = TextEditingController();
  // TextEditingController _lastName = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();
  double? _lat;
  double? _long;
  Completer<GoogleMapController> _mapController = Completer();

  TextEditingController _type = TextEditingController();
  TextEditingController _description = TextEditingController();
  bool _fragile = false;
  bool _express = false;
  TextEditingController _height = TextEditingController();
  TextEditingController _length = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _weight = TextEditingController();

  TextEditingController _pickupDate = TextEditingController();
  TextEditingController _pickupTime = TextEditingController();
  TextEditingController _deliveryTime = TextEditingController();

  TextEditingController _nameDrop = TextEditingController();
  // TextEditingController _lastNameDrop = TextEditingController();
  TextEditingController _mobileDrop = TextEditingController();
  TextEditingController _addressDrop = TextEditingController();
  double? _latDrop;
  double? _longDrop;
  Completer<GoogleMapController> _mapControllerDrop = Completer();

  CameraPosition? _pos;

  @override
  void dispose() {
    _senderName.dispose();
    // _lastName.dispose();
    _mobile.dispose();
    _address.dispose();
    _type.dispose();
    _description.dispose();
    _height.dispose();
    _length.dispose();
    _width.dispose();
    _weight.dispose();
    _pickupDate.dispose();
    _pickupTime.dispose();
    _deliveryTime.dispose();
    _nameDrop.dispose();
    // _lastNameDrop.dispose();
    _mobileDrop.dispose();
    _addressDrop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _buildPages = [
      DeliveryFormOne(
        name: _senderName,
        // lastName: _lastName,
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
        pickupDate: _pickupDate,
        pickupTime: _pickupTime,
        deliveryTime: _deliveryTime,
        onPickUpTab: () async {
          String? d = await customDatePicker(
            context: context,
            date: _pickupDate.text.isEmpty
                ? DateTime.now()
                : DateTime.parse(_pickupDate.text),
          );
          if (d != null) _pickupDate.text = d;
          setState(() {});
        },
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
            Header(title: 'Delivery'),
            Padding(
              padding: const EdgeInsets.symmetric(
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
                physics: NeverScrollableScrollPhysics(),
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
      _pageController
        ..animateToPage(
          _pageController.page!.toInt() - 1,
          duration: Duration(milliseconds: 300),
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
      if (_type.text.length < 2) return;
      if (_description.text.length < 2) return;
      if (_height.text.length < 1) return;
      if (_length.text.length < 1) return;
      if (_weight.text.length < 1) return;
      if (_weight.text.length < 1) return;
      _toNextPage();
    } else if (index == 2) {
      if (_pickupDate.text.isEmpty) return;
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
      _pageController
        ..animateToPage(
          _pageController.page!.toInt() + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
    }
  }

  _requestDelivery() async {
    FocusScope.of(context).requestFocus(FocusNode());

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    var result = await context.read<DeliveryProvider>().requestDelivery(
          senderName: _senderName.text,
          senderAddress: _address.text,
          senderPhone: _mobile.text,
          senderLat: _lat ?? 0.0,
          senderLong: _long ?? 0.0,
          receiverName: _nameDrop.text,
          receiverAddress: _addressDrop.text,
          receiverPhone: _mobileDrop.text,
          receiverLat: _latDrop ?? 0.0,
          receiverLong: _longDrop ?? 0.0,
          packageType: _type.text,
          packageWeight: _weight.text,
          packageSize: '${_height.text}*${_length.text}*${_width.text}',
          pickUpTime: _pickupTime.text,
          dropOffTime: _deliveryTime.text,
          fragile: _fragile ? 1 : 0,
          express: _express ? 1 : 0,
        );

    if (result is bool) {
      context.read<RequestProvider>().fetchPending(
            userId: context.read<AuthenticationProvider>().consumer!.id ?? 43,
          );
      context.read<RequestProvider>().fetchApproved(
            userId: context.read<AuthenticationProvider>().consumer!.id ?? 43,
          );
      progressDialog.dismiss();
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
                  builder: (_) => MainPage(
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
                        SizedBox(height: values.BASE_PADDING),
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
                        SizedBox(height: values.BASE_PADDING),
                        Text(
                          'Delivery request has been sent successfully !!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.w600,
                            color: colors.TEXT_BLUE,
                          ),
                        ),
                        SizedBox(height: values.BASE_PADDING),
                        Text(
                          'Our customer service will contact you once your request is verified.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: values.DETAILS_TEXT,
                            color: colors.YELLOW,
                          ),
                        ),
                        SizedBox(height: values.BASE_PADDING),
                        CustomButton(
                          title: 'Finish',
                          onTab: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainPage(
                                  index: 1,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        SizedBox(height: values.BASE_PADDING),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else if (result is String) {
      progressDialog.dismiss();
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error',
        message: result,
      );
    } else {
      progressDialog.dismiss();
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Delivery Request Error',
        message: 'Oops! Something went wrong. Please try again.',
      );
    }
  }
}
