import 'package:mvvm/generated/json/base/json_convert_content.dart';
import 'package:mvvm/models/todos_entity.dart';

TodosEntity $TodosEntityFromJson(Map<String, dynamic> json) {
  final TodosEntity todosEntity = TodosEntity();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    todosEntity.userId = userId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    todosEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    todosEntity.title = title;
  }
  final bool? completed = jsonConvert.convert<bool>(json['completed']);
  if (completed != null) {
    todosEntity.completed = completed;
  }
  return todosEntity;
}

Map<String, dynamic> $TodosEntityToJson(TodosEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['completed'] = entity.completed;
  return data;
}

extension TodosEntityExtension on TodosEntity {
  TodosEntity copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodosEntity()
      ..userId = userId ?? this.userId
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..completed = completed ?? this.completed;
  }
}