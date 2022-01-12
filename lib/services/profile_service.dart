import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';
import '../models/profile_response_model.dart';

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
}
