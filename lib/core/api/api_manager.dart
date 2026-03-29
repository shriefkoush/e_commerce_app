import 'package:dio/dio.dart';
import 'package:e_commerce_app2/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Options? options,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }
}
