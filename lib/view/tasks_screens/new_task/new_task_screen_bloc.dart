import 'package:flutter/material.dart';
import 'package:things_to_do/main.dart';
import 'package:things_to_do/models/task.dart';
import 'package:things_to_do/utils/colors_parser.dart';

class NewTaskScreenBloc {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  TextEditingController taskNotificationController = TextEditingController();

  Color selectedColor = Colors.black;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context, setState) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool validatePriorityColor() {
    if (taskTitleController.text.isEmpty) {
      return false;
    } else if (taskDescriptionController.text.isEmpty) {
      return false;
    } else if (taskCategoryController.text.isEmpty) {
      return false;
    } else if (taskNotificationController.text.isEmpty) {
      return false;
    } else if (selectedDate.toString().isEmpty) {
      return false;
    } else if (selectedColor == Colors.black) {
      return false;
    }

    return true;
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Field are required'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void newTaskFormValidate(
    BaseWidget base,
    BuildContext context,
  ) {
    if (validatePriorityColor()) {
      var task = Task.create(
        taskTitle: taskTitleController.text,
        taskCategory: taskCategoryController.text,
        taskColor:
            ColorParser().takeColorAndReturnIndex(selectedColor).toString(),
        taskDesc: taskDescriptionController.text,
        taskFinalDate: selectedDate,
      );
      base.dataStore.addTask(task: task);
      Navigator.pop(context);
    } else {
      showToast(context);
    }
  }
}
