import 'package:dio/dio.dart';

class Http {
  static var baseUrl = "https://api.themoviedb.org";

  static var options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 14000,
    receiveTimeout: 5000,
    sendTimeout: 14000,
  );

  static Dio dio = Dio(options);

  static Future<Response> get(endpoint, {Options? options}) async {
    return await dio.get(endpoint, options: options);
  }
}
