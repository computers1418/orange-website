import 'package:dentist_india_plus/helper_functions/custom_print.dart';
import 'package:dio/dio.dart';

class DioService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Response?> get(String path,) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      printC("Exception: $e");
      return e.response;
    }
  }

  Future<Response?> post(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      printC("Exception: $e");
      return e.response;
    }
  }

  Future<Response?> put(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      printC("Exception: $e");
      return e.response;
    }
  }

  Future<Response?> delete(String path) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      printC("Exception: $e");
      return e.response;
    }
  }

  Future<Response?> patch(String path, Map<String, dynamic> data) async {
    try {
      return await _dio.patch(path, data: data);
    } on DioException catch (e) {
      printC("Exception: $e");
      return e.response;
    }
  }
}
