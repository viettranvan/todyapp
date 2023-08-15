import 'package:dio/dio.dart';

import 'index.dart';

class APIClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://identitytoolkit.googleapis.com/v1/',
    ),
  );

  Map<String, dynamic> baseQueryParameters = {
    'key': 'AIzaSyD2FDt8pptyMPV3XU2E1tfc8TxTMaPPbZ0',
  };

  Future<ApiResponse> execute({required APIRequest request}) async {
    final options = Options(
      method: request.method.value,
      contentType: Headers.jsonContentType,
      headers: request.headers,
    );
    try {
      baseQueryParameters.addAll(request.parameters ?? {});
      final response = await dio.request(
        request.path,
        queryParameters: baseQueryParameters,
        data: request.body,
        options: options,
      );

      return ApiResponse.success(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
