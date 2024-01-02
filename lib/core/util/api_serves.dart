import 'package:dio/dio.dart';

class ApiServes {
  static const String _baseUrl = 'http://192.168.7.20:8000/api/';
  static Dio? dio;

  static initial() {
    dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token,
    };
    var response = await dio!.get(url, queryParameters: query);
    return response.data;
  }

  static Future<Map<String, dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };
    var response = await dio!.post(url, data: data, queryParameters: query);
    return response.data;
  }

  static Future<Map<String, dynamic>> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token,
    };
    var response =await dio!.put(url, data: data, queryParameters: query);
    return response.data;
  }

  static Future<Response> get({
    required String url,
    Map<String,dynamic>? query,
    String? token,
  })async
  {
    dio!.options.headers={
      'Authorization':'Bearer $token',
    };
    return await dio!.get(
        url,
        queryParameters: query
    );
  }

}