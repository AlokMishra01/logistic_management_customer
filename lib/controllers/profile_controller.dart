import 'package:flutter/material.dart';

import '../models/profile_response_model.dart';
import '../models/user_model.dart';
import '../services/profile_service.dart';
import 'authentication_controller.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class ProfileController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final AuthenticationController? _authenticationController;
  final DioController? _dioController;

  final _profileService = ProfileService.service;

  ProfileController(
    this._connectivityController,
    this._authenticationController,
    this._dioController,
  ) {
    getProfile();
  }

  getProfile() async {
    if (_isLoading) {
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

    _isLoading = true;
    notifyListeners();

    ProfileResponseModel? model = await _profileService.getProfile(
      dio: _dioController!,
    );

    if (model?.statusCode != 200) {
      return;
    }

    _user = model?.user;
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    if (_isLoading) {
      return false;
    }

    if (_connectivityController == null) {
      return false;
    }

    if (_dioController == null) {
      return false;
    }

    if (_authenticationController == null) {
      return false;
    }

    if (!(_connectivityController?.hasInternet ?? false)) {
      return false;
    }

    if (!(_authenticationController?.isLoggedIn ?? false)) {
      return false;
    }

    _isLoading = true;
    notifyListeners();

    bool b = await _profileService.updateProfile(
      dio: _dioController!,
      name: name,
      email: email,
      phone: phone,
    );

    _isLoading = true;

    if (b) {
      getProfile();
    }

    return b;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _user;
  UserModel? get user => _user;
}
