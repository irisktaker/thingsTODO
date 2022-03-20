import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.createdAt,
      required this.taskTitle,
      required this.taskCategory,
      required this.isFavorite});

  factory Task.create(
          {required String taskTitle,
          DateTime? createdAt,
          required String taskCategory}) =>
      Task(
          id: const Uuid().v1(),
          createdAt: createdAt ?? DateTime.now(),
          taskTitle: taskTitle,
          taskCategory: taskCategory,
          isFavorite: false);

  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  late String taskTitle;

  @HiveField(3)
  late String taskCategory;

  @HiveField(4)
  bool isFavorite;
}
