import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/main.dart';
import '/models/task.dart';
import '../sections/all_tasks_done_section.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
class MonthlyTODOScreen extends StatelessWidget {
  const MonthlyTODOScreen({Key? key}) : super(key: key);

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
                  element.taskFinalDate.day > element.createdAt.day + 7 &&
                  element.taskFinalDate.day >= element.createdAt.day,
            )
            .toList();

        return ListView(
          children: [
            // --
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // --
            (tasks.isNotEmpty)
                ? TasksListSection(tasks, size)
                : AllTasksDoneSection(size),
          ],
        );
      },
    );
  }
}
