import 'package:dio/dio.dart';

class APIInterceptor extends QueuedInterceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
