import 'package:dio/dio.dart';
import 'package:flutter_113/view_model/data/network/end_points.dart';
import '../local/shared_helper.dart';
import '../local/shared_keys.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    try {
      dio?.options.headers = headers;
      if (withToken!) {
        dio?.options.headers = {
          'Authorization': 'Bearer ${await SharedHelper.get(key: SharedKeys.token)}',
        };
      }
      return dio!.get(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    FormData? formData,
    bool? withToken = false,
  }) async {
    try {
      dio?.options.headers = headers;
      if (withToken!) {
        dio?.options.headers = {
          'Authorization': 'Bearer ${await SharedHelper.get(key: SharedKeys.token)}',
        };
      }
      return dio!.post(
        endPoint,
        queryParameters: queryParameters,
        data: formData ?? body,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    try {
      dio?.options.headers = headers;
      if (withToken!) {
        dio?.options.headers = {
          'Authorization': 'Bearer ${await SharedHelper.get(key: SharedKeys.token)}',
        };
      }
      return dio!.put(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> patch({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    try {
      dio?.options.headers = headers;
      if (withToken!) {
        dio?.options.headers = {
          'Authorization': 'Bearer ${await SharedHelper.get(key: SharedKeys.token)}',
        };
      }
      return dio!.patch(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool? withToken = false,
  }) async {
    try {
      dio?.options.headers = headers;
      if (withToken!) {
        dio?.options.headers = {
          'Authorization': 'Bearer ${await SharedHelper.get(key: SharedKeys.token)}',
        };
      }
      return dio!.delete(
        endPoint,
        queryParameters: queryParameters,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }
}
