import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logistic_management_customer/models/message_response_model.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';

class MessageService {
  static MessageService service = MessageService();

  Future<MessageResponseModel?> getMessages({
    required DioController dio,
    required int page,
    required int limit,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/messages?page=$page&limit=$limit',
      );
      log(prettyJson(response.data), name: 'Get Messages');
      if (response.statusCode == 200) {
        return MessageResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Package List Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<String> postMessage({
    required DioController dio,
    required String subject,
    required String message,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/message',
        data: {
          "subject": subject,
          "message": message,
        },
      );
      log(prettyJson(response.data), name: 'Send Message Request Response');
      if (response.statusCode == 200) {
        if ((response.data['status'] as bool)) {
          return '';
        } else {
          return response.data['message'] as String;
        }
      } else {
        return 'Oops! Some thing went wrong.';
      }
    } on Exception catch (e, s) {
      log('Send Delivery Request  Error!', stackTrace: s, error: e);
      return 'Oops! Some thing went wrong.';
    }
  }
}
