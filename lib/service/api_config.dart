import 'package:dio/dio.dart';

import 'api_interceptors.dart';
import 'api_path.dart';

class APIConfig {
  static BaseOptions config() {
    return BaseOptions(
        baseUrl: APIPath.baseUrl,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
        headers: {'Content-Type': 'application/json', 'lang': 'th'});
  }

  static Dio getDio() {
    final _dio = Dio(APIConfig.config());
    _dio.interceptors.add(
      APIInterceptors(),
    );
    return _dio;
  }

}
