import 'package:dio/dio.dart';

import 'api_config.dart';
import 'api_path.dart';

class ApiService {
  final Dio _dio = APIConfig.getDio();

  Future<List<dynamic>> getTodos() async {
    try {
      final response = await _dio.get(APIPath.todos);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
