import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/consumer_mode.dart';

import '../services/api_service/client.dart';
import '../services/storage/preference_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  PreferenceService _preferenceService = PreferenceService();
  Client _client = Client();
  bool _isLoggedIn = false;
  ConsumerModel? _consumer;

  AuthenticationProvider() {
    _init();
  }

  _init() async {
    await _preferenceService.init();
  }

  dynamic login({required String phone, required String password}) {}

  dynamic getConsumerInfo({required int id}) {}

  dynamic changePassword({required int id}) {}

  dynamic register({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
  }) {}

  dynamic verifyOTP({required int id, required String otp}) {}
}
