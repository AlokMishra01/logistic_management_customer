import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnection extends ChangeNotifier {
  bool _hasNetworkConnection = false;

  NetworkConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      switch (result) {
        case ConnectivityResult.none:
          _hasNetworkConnection = false;
          break;
        default:
          _hasNetworkConnection = true;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Getters
  bool get hasInternet => _hasNetworkConnection;
}
