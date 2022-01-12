import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logistic_management_customer/models/notification_response_model.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';

class NotificationService {
  static NotificationService service = NotificationService();

  Future<NotificationResponseModel?> getAllNotification({
    required DioController dio,
    required int page,
    int limit = 50,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/notifications?page=$page&limit=$limit',
      );
      log(prettyJson(response.data), name: 'Get All Notification Response');
      if (response.statusCode == 200) {
        return NotificationResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get All Notification Error!', stackTrace: s, error: e);
      return null;
    }
  }

  getNotificationById({
    required DioController dio,
    required int id,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/notification/$id',
      );
      log(prettyJson(response.data), name: 'Get Notification By Id Response');
      if (response.statusCode == 200) {
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Notification By Id  Error!', stackTrace: s, error: e);
      return null;
    }
  }
}
