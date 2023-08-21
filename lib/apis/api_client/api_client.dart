import 'package:dio/dio.dart';

import 'index.dart';

enum ApiVersion {
  ver1,
  ver3,
}

class APIClient {
  final Dio dioV1 = Dio(
    BaseOptions(
      baseUrl: 'https://identitytoolkit.googleapis.com/v1/',
    ),
  );

  final Dio dioV3 = Dio(
    BaseOptions(
      baseUrl: 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/',
    ),
  );

  Map<String, dynamic> baseQueryParameters = {
    'key': const String.fromEnvironment('ApiKey', defaultValue: ''),
  };

  Future<ApiResponse> execute({
    required APIRequest request,
    ApiVersion apiVersion = ApiVersion.ver1,
  }) async {
    final options = Options(
      method: request.method.value,
      contentType: Headers.jsonContentType,
      headers: request.headers,
    );
    try {
      baseQueryParameters.addAll(request.parameters ?? {});
      late Dio dio;
      switch (apiVersion) {
        case ApiVersion.ver1:
          dio = dioV1;
          break;
        case ApiVersion.ver3:
          dio = dioV3;
          break;
        default:
          dio = dioV1;
      }
      final response = await dio.request(
        request.path,
        queryParameters: baseQueryParameters,
        data: request.body,
        options: options,
      );

      return ApiResponse.success(response.data);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          throw ApiResponse.error(error.response?.data["error"]["message"]);

        default:
          throw ApiResponse.error(error.response?.data["error"]["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}
