import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/notification_response_model.dart';
import 'package:logistic_management_customer/services/notification_service.dart';

import 'authentication_controller.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class NotificationController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final AuthenticationController? _authenticationController;
  final DioController? _dioController;

  final _notificationService = NotificationService.service;

  NotificationController(
    this._connectivityController,
    this._authenticationController,
    this._dioController,
  ) {
    getNotifications();
  }

  getNotifications() async {
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

    NotificationResponseModel? model = await _notificationService
        .getAllNotification(dio: _dioController!, page: _page);

    if (model?.statusCode != 200) {
      return;
    }

    _notifications
      ..clear()
      ..addAll(model?.data?.data ?? []);
    _isLoading = false;
    notifyListeners();
  }

  int _page = 1;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<NotificationData> _notifications = [];
  List<NotificationData> get notifications => _notifications;
}
