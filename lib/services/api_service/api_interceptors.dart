import 'dart:developer';

import 'package:dio/dio.dart';

import '../storage/preference_service.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log(options.uri.toString(), name: 'URL');
    PreferenceService p = PreferenceService();
    await p.init();
    print(p.token);
    String token = p.token;
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.data}', name: 'RESPONSE DATA');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
