import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/message_response_model.dart';
import 'package:logistic_management_customer/services/message_service.dart';

import 'authentication_controller.dart';
import 'connectivity_controller.dart';
import 'dio_controller.dart';

class MessageController with ChangeNotifier {
  final ConnectivityController? _connectivityController;
  final AuthenticationController? _authenticationController;
  final DioController? _dioController;

  final _messageService = MessageService.service;

  MessageController(
    this._connectivityController,
    this._authenticationController,
    this._dioController,
  ) {
    if (_connectivityController != null &&
        _authenticationController != null &&
        _dioController != null) {
      getMessages();
    }
  }

  getMessages() async {
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

    MessageResponseModel? model = await _messageService.getMessages(
      dio: _dioController!,
      page: 1,
      limit: 100,
    );

    if (model != null) {
      _messages
        ..clear()
        ..addAll(model.data?.messages ?? []);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<String> sendMessage({
    required String subject,
    required String message,
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

    String s = await _messageService.postMessage(
      dio: _dioController!,
      subject: subject,
      message: message,
    );

    if (s.isEmpty) {
      getMessages();
    }

    return s;
  }

  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
}
