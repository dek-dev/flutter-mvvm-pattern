import 'package:get/get.dart';

import 'models/todos_entity.dart';
import 'repositories/todos_repository.dart';

class TodosViewModel extends GetxController {

  final TodosRepository _userRepository = TodosRepository();

  List<TodosEntity> get todos => _toDos;

  //error message
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  //Loading
  RxBool _loading = false.obs;

  RxBool get loading => _loading;

  //data user
  final RxList<TodosEntity> _toDos = <TodosEntity>[].obs;

  Future<void> fetchTodos() async {
    _loading.value = true;
    _errorMessage = '';
    try {
      final todoList = await _userRepository.getTodos();
      if (todoList != null) {
        _toDos.value = todoList;
      } else {
        fail();
      }
    } catch (e) {
      fail();
    } finally {
      _loading.value = false;
      update();
    }
  }

  void fail() {
    _loading.value = false;
    _errorMessage = 'Failed to fetch users';
  }
}
