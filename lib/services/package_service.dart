import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logistic_management_customer/models/package_response_model.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';
import '../models/package_type_model.dart';
import '../models/package_type_response_model.dart';

class PackageService {
  static PackageService service = PackageService();

  Future<List<PackageTypeModel>> getPackageType({
    required DioController dio,
  }) async {
    try {
      Response response = await dio.dioClient.get('package/types');
      log(prettyJson(response.data), name: 'Get Package Type Response');
      if (response.statusCode == 200) {
        PackageTypeResponseModel p = PackageTypeResponseModel.fromJson(
          response.data,
        );
        return p.packages ?? [];
      } else {
        return [];
      }
    } on Exception catch (e, s) {
      log('Get Package Type Error!', stackTrace: s, error: e);
      return [];
    }
  }

  Future<PackageResponseModel?> getPackageList({
    required DioController dio,
    required String query,
    // All / Not Received / In Transit / Picked Up / At Watehouse / Dispatched / Completed
    required int page,
    required int limit,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/package/list?status=$query&page=$page&limit=$limit',
      );
      log(prettyJson(response.data), name: 'Get Package List Response');
      if (response.statusCode == 200) {
        return PackageResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Package List Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<PackageModel?> getMyRequests({
    required DioController dio,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/delivery/latest',
      );
      log(prettyJson(response.data), name: 'Get My Request Response');
      if (response.statusCode == 200) {
        if (response.data['status'] ?? false) {
          return PackageModel.fromJson(response.data['data']);
        }
        return null;
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get My Request Error!', stackTrace: s, error: e);
      return null;
    }
  }

  getPackageById({
    required DioController dio,
    required int id,
  }) async {
    try {
      Response response = await dio.dioClient.get(
        'consumer/package/$id',
      );
      log(prettyJson(response.data), name: 'Get Package By Id Response');
      if (response.statusCode == 200) {
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Package By Id  Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<String> sendDeliveryRequest({
    required DioController dio,
    required String senderName,
    required String senderAddress,
    required String senderMobileNumber,
    required double senderLatitude,
    required double senderLongitude,
    required String receiverName,
    required String receiverAddress,
    required String receiverMobileNumber,
    required double receiverLatitude,
    required double receiverLongitude,
    required int packageType,
    required int packageWeight,
    required int packageSize,
    required String pickUpTime,
    required String dropOffTime,
    required int fragile,
    required String packagePrice,
    required int express,
    required String packageDescription,
    required String pickUpDate,
    required String dropOffDate,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/delivery/request',
        data: {
          "sender_name": senderName,
          "sender_address": senderAddress,
          "sender_mobileno": senderMobileNumber,
          "sender_lat": senderLatitude,
          "sender_lon": senderLongitude,
          "reciever_name": receiverName,
          "reciever_address": receiverAddress,
          "reciever_mobileno": receiverMobileNumber,
          "reciever_lat": receiverLatitude,
          "reciever_lon": receiverLongitude,
          "package_type": packageType,
          "package_weight": packageWeight,
          "package_size": packageSize,
          "package_description": packageDescription,
          "pickup_time": pickUpTime,
          "dropoff_time": dropOffTime,
          "pickup_date": pickUpDate,
          "dropoff_date": dropOffDate,
          "fragile": fragile,
          "package_price": packagePrice,
          "express": express,
        },
      );
      log(prettyJson(response.data), name: 'Send Delivery Request Response');
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
