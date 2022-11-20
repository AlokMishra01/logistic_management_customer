import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/login_response_model.dart';
import '../services/authentication_service.dart';
import '../services/preference_service.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class AuthenticationController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final DioController? _dioController;

  final _authenticationService = AuthenticationService.service;
  final _preferenceService = PreferenceService.service;

  AuthenticationController(this._connectivityController, this._dioController) {
    if (_connectivityController != null && _dioController != null) {
      _initLogin();
    }
  }

  _initLogin() async {
    _isLoggedIn = await _preferenceService.isLogin;
    notifyListeners();
  }

  Future<String> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    if (_dioController == null) {
      return 'Oops! Something went wrong.';
    }

    log(password);

    LoginResponseModel? model = await _authenticationService.register(
      dio: _dioController!,
      name: name,
      email: email,
      phone: phone,
      password: password,
    );

    if (model?.statusCode != 200) {
      return model?.message ?? 'Oops! Something went wrong.';
    }

    await _preferenceService.setUser(model!);
    _initLogin();

    return '';
  }

  Future<String> login({
    required String phone,
    required String password,
  }) async {
    if (_dioController == null) {
      return 'Oops! Something went wrong.';
    }

    LoginResponseModel? model = await _authenticationService.login(
      dio: _dioController!,
      phone: phone,
      password: password,
    );

    if (model?.statusCode != 200) {
      return model?.message ?? 'Oops! Something went wrong.';
    }

    await _preferenceService.setUser(model!);
    _initLogin();

    return '';
  }

  logOut() async {
    await _preferenceService.clearPreferences();
    _initLogin();
  }

  Future<bool> removeAccount() async {
    if (_dioController == null) {
      return false;
    }

    bool b = await _authenticationService.removeAccount(
      dio: _dioController!,
    );

    return b;
  }

  /// Data
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
}
