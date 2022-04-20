import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/banner_response_model.dart';
import 'package:logistic_management_customer/models/pricing_response_model.dart';
import 'package:logistic_management_customer/services/general_service.dart';

import 'authentication_controller.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class GeneralController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final AuthenticationController? _authenticationController;
  final DioController? _dioController;

  final _service = GeneralService.service;

  GeneralController(
    this._connectivityController,
    this._authenticationController,
    this._dioController,
  ) {
    getBanners();
  }

  getBanners() async {
    if (_connectivityController == null) {
      return;
    }

    if (_dioController == null) {
      return;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return;
    }

    BannerResponseModel? model = await _service.geBanners(dio: _dioController!);

    if (model?.statusCode != 200) {
      return;
    }

    _banners
      ..clear()
      ..addAll(model?.banners ?? []);
    notifyListeners();
  }

  Future<PricingResponseModel?> getPricing({
    required String from,
    required String to,
  }) async {
    if (_connectivityController == null) {
      return null;
    }

    if (_dioController == null) {
      return null;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return null;
    }

    PricingResponseModel? model = await _service.getPricing(
      dio: _dioController!,
      from: from,
      to: to,
    );

    return model;
  }

  final List<BannerData> _banners = [];
  List<BannerData> get banners => _banners;
}
