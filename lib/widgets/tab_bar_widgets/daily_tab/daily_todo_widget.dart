// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import '/main.dart';
import '/models/task.dart';
import '../sections/all_tasks_done_section.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
import '/widgets/tab_bar_widgets/sections/completed_tasks_section.dart';

class DailyTODOScreen extends StatefulWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        tasks = tasks
            .where(
              (element) =>
                  element.taskFinalDate.day == DateTime.now().day &&
                  element.taskFinalDate.month == DateTime.now().month &&
                  element.taskFinalDate.year == DateTime.now().year,
            )
            .toList();

        return ListView(
          children: [
            // --
            CompletedTasksSection(tasks),

            // --
            (tasks.isNotEmpty)
                ? TasksListSection(tasks, size)
                : AllTasksDoneSection(tasks, size),
          ],
        );
      },
    );
  }
}
