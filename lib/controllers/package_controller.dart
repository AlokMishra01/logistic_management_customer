import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/package_response_model.dart';

import '../models/package_type_model.dart';
import '../services/package_service.dart';
import 'authentication_controller.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class PackageController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final AuthenticationController? _authenticationController;
  final DioController? _dioController;

  final _packageService = PackageService.service;

  PackageController(
    this._connectivityController,
    this._authenticationController,
    this._dioController,
  ) {
    if (_connectivityController != null &&
        _authenticationController != null &&
        _dioController != null) {
      getMyRequest();
      getPackageList();
      getPackageList(status: 'Pending');
      getPackageList(status: 'Delivered');
      getPackageType();
    }
  }

  getPackageType() async {
    if (_isLoadingType) {
      return;
    }

    if (_connectivityController == null) {
      return;
    }

    if (_dioController == null) {
      return;
    }

    if (_authenticationController == null) {
      return;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return;
    }

    if (!(_authenticationController?.isLoggedIn ?? false)) {
      return;
    }

    _isLoadingType = true;
    notifyListeners();

    _packageTypes = await _packageService.getPackageType(
      dio: _dioController!,
    );

    _isLoadingType = false;
    notifyListeners();
  }

  getPackageList({String status = 'All'}) async {
    // if (_isLoadingPackages) {
    //   return;
    // }

    if (_connectivityController == null) {
      return;
    }

    if (_dioController == null) {
      return;
    }

    if (_authenticationController == null) {
      return;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return;
    }

    if (!(_authenticationController?.isLoggedIn ?? false)) {
      return;
    }

    // _isLoadingPackages = true;
    // notifyListeners();

    // All / Not Received / In Transit / Picked Up / At Watehouse / Dispatched / Completed
    PackageResponseModel? model = await _packageService.getPackageList(
      dio: _dioController!,
      query: status,
      page: 1,
      limit: 1000,
    );

    log(status);
    if (status == 'Active') {
      if (model != null) {
        _packageActive
          ..clear()
          ..addAll(model.data?.packages ?? []);
      }
    } else if (status == 'Pending') {
      if (model != null) {
        _packagePending
          ..clear()
          ..addAll(model.data?.packages ?? []);
      }
    } else if (status == 'Delivered') {
      if (model != null) {
        _packageCompleted
          ..clear()
          ..addAll(model.data?.packages ?? []);
      }
    } else {
      if (model != null) {
        _packageAll
          ..clear()
          ..addAll(model.data?.packages ?? []);
      }
    }

    // _isLoadingPackages = false;
    notifyListeners();
  }

  getMyRequest() async {
    // if (_isLoadingMyRequest) {
    //   return;
    // }

    if (_connectivityController == null) {
      return;
    }

    if (_dioController == null) {
      return;
    }

    if (_authenticationController == null) {
      return;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return;
    }

    if (!(_authenticationController?.isLoggedIn ?? false)) {
      return;
    }

    // _isLoadingMyRequest = true;
    // notifyListeners();

    // _myRequest = await _packageService.getMyRequests(
    //   dio: _dioController!,
    // );

    final response = await _packageService.getPackageList(
      dio: _dioController!,
      query: 'Active',
      page: 1,
      limit: 1,
    );

    _myRequest = response?.data?.packages?.single;

    // _isLoadingMyRequest = false;
    notifyListeners();
  }

  Future<String> sendDeliveryRequest({
    required String senderName,
    required String senderAddress,
    required String senderMobileNumber,
    required double senderLatitude,
    required double senderLongitude,
    required String receiverName,
    required String receiverAddress,
    required String receiverMobileNumber,
    required double receiverLatitude,
    required double receiverLongitude,
    required int packageType,
    required int packageWeight,
    required int packageSize,
    required String pickUpTime,
    required String dropOffTime,
    required int fragile,
    required String packagePrice,
    required int express,
    required String packageDescription,
    required String pickUpDate,
    required String dropOffDate,
  }) async {
    if (_connectivityController == null) {
      return 'Internet connection issue. '
          'Please make sure you are connected to internet.';
    }

    if (_dioController == null) {
      return 'Oops! Some thing went wrong. Please try again.';
    }

    if (_authenticationController == null) {
      return 'Authentication Issue. Please login to make this request.';
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return 'Internet connection issue. '
          'Please make sure you are connected to internet.';
    }

    if (!(_authenticationController?.isLoggedIn ?? false)) {
      return 'Authentication Issue. Please login to make this request.';
    }

    String s = await _packageService.sendDeliveryRequest(
      dio: _dioController!,
      senderName: senderName,
      senderAddress: senderAddress,
      senderMobileNumber: senderMobileNumber,
      senderLatitude: senderLatitude,
      senderLongitude: senderLongitude,
      receiverName: receiverName,
      receiverAddress: receiverAddress,
      receiverMobileNumber: receiverMobileNumber,
      receiverLatitude: receiverLatitude,
      receiverLongitude: receiverLongitude,
      packageType: packageType,
      packageWeight: packageWeight,
      packageSize: packageSize,
      packageDescription: packageDescription,
      pickUpTime: pickUpTime,
      dropOffTime: dropOffTime,
      pickUpDate: pickUpDate,
      dropOffDate: dropOffDate,
      fragile: fragile,
      packagePrice: packagePrice,
      express: express,
    );

    try {
      if (s.isEmpty) {
        await getMyRequest();
        getPackageList();
        getPackageList(status: 'Pending');
        getPackageList(status: 'Delivered');
      }
    } catch (e) {}

    return s;
  }

  bool _isLoadingType = false;
  bool get isLoadingType => _isLoadingType;
  List<PackageTypeModel> _packageTypes = [];
  List<PackageTypeModel> get packageTypes => _packageTypes;

  List<PackageModel> _packageAll = [];
  List<PackageModel> get packageAll => _packageAll;
  // bool _isLoadingPackages = false;
  // bool get isLoadingPackages => _isLoadingPackages;

  List<PackageModel> _packageActive = [];
  List<PackageModel> get packageActive => _packageActive;

  List<PackageModel> _packagePending = [];
  List<PackageModel> get packagePending => _packagePending;

  List<PackageModel> _packageCompleted = [];
  List<PackageModel> get packageCompleted => _packageCompleted;

  PackageModel? _myRequest;
  PackageModel? get myRequest => _myRequest;
  bool _isLoadingMyRequest = false;
  bool get isLoadingMyRequest => _isLoadingMyRequest;
}
