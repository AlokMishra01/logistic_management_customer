import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  PreferenceService() {
    _initSharedPreferences();
  }

  _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Getter and Setters to store, manipulate, delete and get stored data
}
