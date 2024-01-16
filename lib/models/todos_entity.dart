import 'package:mvvm/generated/json/base/json_field.dart';
import 'package:mvvm/generated/json/todos_entity.g.dart';
import 'dart:convert';
export 'package:mvvm/generated/json/todos_entity.g.dart';

@JsonSerializable()
class TodosEntity {
	late int userId;
	late int id;
	late String title;
	late bool completed;

	TodosEntity();

	factory TodosEntity.fromJson(Map<String, dynamic> json) => $TodosEntityFromJson(json);

	Map<String, dynamic> toJson() => $TodosEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}