import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_json/pretty_json.dart';
import '../../models/consumer_mode.dart';
import '../../services/connectivity/network_connection.dart';

import '../services/api_service/client.dart';
import '../services/storage/preference_service.dart';
import '../constants/apis.dart' as apis;

class AuthenticationProvider extends ChangeNotifier {
  NetworkConnection _network;
  PreferenceService _preferenceService = PreferenceService();
  Dio _dio = Dio();
  bool _isLoggedIn = false;
  ConsumerModel? _consumer;

  AuthenticationProvider(this._network) {
    _initilize();
  }

  _initilize() async {
    _dio = Client().init();
    await _preferenceService.init();
    _isLoggedIn = _preferenceService.isLogin;
    if (_isLoggedIn) {
      _consumer = _preferenceService.consumer;
    }
  }

  dynamic login({required String phone, required String password}) {
    if (_network.hasInternet) {
      _dio.post(apis.LOGIN, data: {
        'mobile': phone,
        'password': password,
      }).then((value) {
        log(
          jsonEncode(prettyJson(value.data)),
          name: 'Login Response Data',
        );
      }).onError((error, stackTrace) {
        log(
          error.toString(),
          name: 'Login Error',
          stackTrace: stackTrace,
        );
      });
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  dynamic logOut() {
    _preferenceService.clearPreferences();
    _isLoggedIn = _preferenceService.isLogin;
    if (!_isLoggedIn)
      _consumer = null;
    else
      _consumer = _preferenceService.consumer;
    notifyListeners();
  }

  dynamic getConsumerInfo({required int id}) {
    if (_network.hasInternet) {
      _dio.post(apis.CONSUMER_INFO, data: {
        'id': id,
      }).then((value) {
        log(
          jsonEncode(prettyJson(value.data)),
          name: 'Consumner Info Response Data',
        );
      }).onError((error, stackTrace) {
        log(
          error.toString(),
          name: 'Consumner Info Error',
          stackTrace: stackTrace,
        );
      });
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  dynamic changePassword({required int id, required String password}) {
    if (_network.hasInternet) {
      _dio.post(apis.CHANGE_PASSWORD, data: {
        'id': id,
        'password': password,
      }).then((value) {
        log(
          jsonEncode(prettyJson(value.data)),
          name: 'Change Password Response Data',
        );
      }).onError((error, stackTrace) {
        log(
          error.toString(),
          name: 'Change Password Error',
          stackTrace: stackTrace,
        );
      });
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  dynamic register({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
  }) {
    if (_network.hasInternet) {
      _dio.post(apis.CHANGE_PASSWORD, data: {
        'name': name,
        'email': email,
        'mobile': phone,
        'address': address,
        'password': password,
      }).then((value) {
        log(
          jsonEncode(prettyJson(value.data)),
          name: 'Register Response Data',
        );
      }).onError((error, stackTrace) {
        log(
          error.toString(),
          name: 'Register Error',
          stackTrace: stackTrace,
        );
      });
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  dynamic verifyOTP({required int id, required String otp}) {
    if (_network.hasInternet) {
      _dio.post(apis.CHANGE_PASSWORD, data: {
        'id': id,
        'otp_code': otp,
      }).then((value) {
        log(
          jsonEncode(prettyJson(value.data)),
          name: 'Verify OTP Data',
        );
      }).onError((error, stackTrace) {
        log(
          error.toString(),
          name: 'Verify OTP Error',
          stackTrace: stackTrace,
        );
      });
    } else {
      return 'No internet connection. Please connect to internet.';
    }
  }

  // Getters
  bool get isKoggedIn => _isLoggedIn;
  ConsumerModel? get consumer => _consumer;
}
