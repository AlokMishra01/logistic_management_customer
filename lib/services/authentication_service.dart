import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';
import '../models/login_response_model.dart';

class AuthenticationService {
  static AuthenticationService service = AuthenticationService();

  Future<LoginResponseModel?> register({
    required DioController dio,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/register',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
        },
      );
      log(prettyJson(response.data), name: 'Register Response');
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Register Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<LoginResponseModel?> login({
    required DioController dio,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'consumer/login',
        data: {
          "phone": phone,
          "password": password,
        },
      );
      log(prettyJson(response.data), name: 'Login Response');
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Login Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<bool> removeAccount({
    required DioController dio,
  }) async {
    try {
      Response response = await dio.dioClient.delete(
        'consumer/profile/delete',
      );
      log(prettyJson(response.data), name: 'Remove Response');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e, s) {
      log('Remove Error!', stackTrace: s, error: e);
      return false;
    }
  }
}
