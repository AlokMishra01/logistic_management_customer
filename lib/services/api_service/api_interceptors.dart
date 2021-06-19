import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {}

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {}
}
