import 'package:flutter/material.dart';

class NewTask {
  // String taskAddedTime;
  String taskName;
  String taskDescription;
  String taskCategory;
  // String taskDateTime; from calender
  Color taskPriority;
  bool isDone;
  bool isDeleted;
  bool isFavorite;
  String taskNotification;

  NewTask({
    // required this.taskAddedTime,
    required this.taskName,
    required this.taskDescription,
    required this.taskCategory,
    // required this.taskDateTime,
    required this.taskPriority,
    required this.isDone,
    required this.isDeleted,
    required this.isFavorite,
    required this.taskNotification,
  });
}
