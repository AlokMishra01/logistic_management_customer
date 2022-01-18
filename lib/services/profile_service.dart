import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logistic_management_customer/constants/api_constants.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';
import '../models/profile_response_model.dart';
import 'preference_service.dart';

class ProfileService {
  static ProfileService service = ProfileService();

  Future<ProfileResponseModel?> getProfile({
    required DioController dio,
  }) async {
    try {
      Response response = await dio.dioClient.get('consumer/profile');
      if (response.statusCode == 200) {
        return ProfileResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Register Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<bool> updateProfile({
    required DioController dio,
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/profile/update',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
        },
      );
      log(prettyJson(response.data), name: 'Update Profile Response');
      if (response.statusCode == 200) {
        return response.data['status'] as bool;
      } else {
        return false;
      }
    } on Exception catch (e, s) {
      log('Update Profile Error!', stackTrace: s, error: e);
      return false;
    }
  }

  Future<bool> updateAddress({
    required DioController dio,
    required String city,
    required String street,
    required String province,
    required String district,
    required String country,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/address/update',
        data: {
          "city": city,
          "street": street,
          "province": province,
          "district": district,
          "country": country,
        },
      );
      log(prettyJson(response.data), name: 'Update Address');
      if (response.statusCode == 200) {
        return response.data['status'] as bool;
      } else {
        return false;
      }
    } on Exception catch (e, s) {
      log('Update Address Error!', stackTrace: s, error: e);
      return false;
    }
  }

  Future<bool> updateImage({
    required DioController dio,
    required String path,
  }) async {
    try {
      Dio _dio = Dio();
      String token = await PreferenceService.service.token;
      _dio.options.headers.addAll({
        'Authorization': 'Bearer $token',
        'accept': '*/*',
        'Content-Type': 'multipart/form-data',
      });
      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(path),
      });
      Response response = await _dio.post(
        '${APIConstants.baseUrl}consumer/profile/image/update',
        data: formData,
      );
      log(prettyJson(response.data), name: 'Update Image');
      if (response.statusCode == 200) {
        return response.data['status'] as bool;
      } else {
        return false;
      }
    } on Exception catch (e, s) {
      log('Update Image Error!', stackTrace: s, error: e);
      return false;
    }
  }
}
