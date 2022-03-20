// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import '/main.dart';
import '/models/task.dart';
import 'sections/completed_tasks_section.dart';
import '../daily_tab/sections/tasks_list_section.dart';
import '../daily_tab/sections/all_tasks_done_section.dart';

class DailyTODOScreen extends StatefulWidget {
  DailyTODOScreen(this.doneTasks, {Key? key}) : super(key: key);

  int doneTasks;

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);
    final box = base.dataStore.box;

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
            CompletedTasksSection(base, box, widget.doneTasks),

            // --
            (tasks.isNotEmpty)
                ? TasksListSection(size, base, box, tasks, widget.doneTasks,
                    (task) {
                    setState(() {
                      widget.doneTasks = task;
                    });
                  })
                : AllTasksDoneSection(size),
          ],
        );
      },
    );
  }
}
