import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logistic_management_customer/models/banner_response_model.dart';
import 'package:logistic_management_customer/models/pricing_response_model.dart';
import 'package:pretty_json/pretty_json.dart';

import '../controllers/dio_controller.dart';

class GeneralService {
  static GeneralService service = GeneralService();

  Future<BannerResponseModel?> geBanners({required DioController dio}) async {
    try {
      Response response = await dio.dioClient.get('consumer/banners');
      log(prettyJson(response.data), name: 'Get Banner Response');
      if (response.statusCode == 200) {
        return BannerResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Banner Error!', stackTrace: s, error: e);
      return null;
    }
  }

  Future<PricingResponseModel?> getPricing({
    required DioController dio,
    required String from,
    required String to,
  }) async {
    try {
      Response response = await dio.dioClient.post(
        'pricings',
        data: {"from": from, "to": to},
      );
      log(prettyJson(response.data), name: 'Get Pricing Response');
      if (response.statusCode == 200) {
        return PricingResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e, s) {
      log('Get Pricing Error!', stackTrace: s, error: e);
      return null;
    }
  }
}
