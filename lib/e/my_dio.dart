import 'package:dio/dio.dart';

class MyDio {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      headers: {
        "lang": "ar",
        "Content-Type": "application/json",
      },
    ));
  }

  static Future<Response> postData({
    String endPoint,
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    String token,
  }) async {
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": token
    };

    return await dio.post(endPoint, data: data, queryParameters: queryParameters);
  }

    static Future<Response> putData({
    String endPoint,
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    String token,
  }) async {
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": token
    };

    return await dio.put(endPoint, data: data, queryParameters: queryParameters);
  }

    static Future<Response> deleteData({
    String endPoint,
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    String token,
  }) async {
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": token
    };

    return await dio.delete(endPoint, data: data, queryParameters: queryParameters);
  }

     static Future<Response> getData({
    String endPoint,
    Map<String, dynamic> queryParameters,
    String token,
  }) async {
    dio.options.headers = {
      "lang": "ar",
      "Content-Type": "application/json",
      "Authorization": token
    };

    return await dio.get(endPoint, queryParameters: queryParameters);
  }

}
