import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';
import 'delivery_form_four.dart';
import 'delivery_form_one.dart';
import 'delivery_form_three.dart';
import 'delivery_form_two.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({Key? key}) : super(key: key);

  @override
  _DeliveryFormState createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  PageController _pageController = PageController();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();
  Completer<GoogleMapController> _mapController = Completer();

  TextEditingController _type = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _length = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _weight = TextEditingController();

  TextEditingController _pickupDate = TextEditingController();
  TextEditingController _pickupTime = TextEditingController();
  TextEditingController _deliveryTime = TextEditingController();

  TextEditingController _firstNameDrop = TextEditingController();
  TextEditingController _lastNameDrop = TextEditingController();
  TextEditingController _mobileDrop = TextEditingController();
  TextEditingController _addressDrop = TextEditingController();
  Completer<GoogleMapController> _mapControllerDrop = Completer();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
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
    _firstNameDrop.dispose();
    _lastNameDrop.dispose();
    _mobileDrop.dispose();
    _addressDrop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _buildPages = [
      DeliveryFormOne(
        firstName: _firstName,
        lastName: _lastName,
        mobile: _mobile,
        address: _address,
        mapController: _mapController,
        onNext: _nextPage,
      ),
      DeliveryFormTwo(
        type: _type,
        description: _description,
        height: _height,
        length: _length,
        width: _width,
        weight: _weight,
        onPre: _prePage,
        onNext: _nextPage,
      ),
      DeliveryFormThree(
        pickupDate: _pickupDate,
        pickupTime: _pickupTime,
        deliveryTime: _deliveryTime,
        onPre: _prePage,
        onNext: _nextPage,
      ),
      DeliveryFormFour(
        firstName: _firstNameDrop,
        lastName: _lastNameDrop,
        mobile: _mobileDrop,
        address: _addressDrop,
        mapController: _mapControllerDrop,
        onPre: _prePage,
        onNext: _nextPage,
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
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_SECONDARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
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
    if (_pageController.page!.toInt() > 0)
      _pageController
        ..animateToPage(
          _pageController.page!.toInt() - 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
  }

  _nextPage() {
    if (_pageController.page!.toInt() < 3)
      _pageController
        ..animateToPage(
          _pageController.page!.toInt() + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
  }
}
