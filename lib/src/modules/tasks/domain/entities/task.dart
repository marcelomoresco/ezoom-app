// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String? id;
  String title;
  String description;
  bool isDone;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
