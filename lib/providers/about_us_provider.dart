import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/services/api_service/client.dart';

import '../models/about_us_model.dart';
import '../services/connectivity/network_connection.dart';
import '../constants/apis.dart' as apis;

class AboutUsProvider extends ChangeNotifier {
  NetworkConnection _network = NetworkConnection();
  Dio _dio = Dio();
  bool _initilizing = true;
  String _error = '';
  AboutUsModel? _aboutUs;

  AboutUsProvider(this._network) {
    _dio = Client().init();
    fetchAboutUs(init: true);
  }

  fetchAboutUs({bool init = false}) async {
    _error = '';
    if (init)
      _initilizing = true;
    else
      notifyListeners();

    if (_network.hasInternet) {
      try {
        Response r = await _dio.get('${apis.ABOUT_US}');
        if (r.statusCode! >= 200 && r.statusCode! < 300) {
          if (r.data['response'] is Map) {
            _aboutUs = AboutUsModel.fromJson(r.data);
          } else {
            _error = r.data['message'] as String;
          }
        }
      } catch (e) {
        if (e is DioError) {
          _error = e.message;
          log(e.message, name: 'AboutUsProvider.fetchAboutUs');
        } else {
          _error = 'Oops! Some thing went wrong. Please try again.';
          log(e.toString(), name: 'AboutUsProvider.fetchAboutUs');
        }
      }
    } else {
      _error = 'No internet connection. Please connect to internet.';
    }
    _initilizing = false;
    notifyListeners();
  }

  // Getters
  bool get initilizing => _initilizing;
  String get error => _error;
  AboutUsModel? get aboutUs => _aboutUs;
}
