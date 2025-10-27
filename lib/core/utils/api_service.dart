import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
  }
}
