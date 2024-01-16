
import '../models/todos_entity.dart';
import '../service/api_service.dart';

class TodosRepository {
  final _apiService = ApiService();

  Future<List<TodosEntity>?> getTodos() async {
    try {
      final data = await _apiService.getTodos();
      return data.map((json) => TodosEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }
}
