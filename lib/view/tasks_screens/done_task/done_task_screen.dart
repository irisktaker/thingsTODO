import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/main.dart';
import '/models/task.dart';
import '../new_task/new_task_screen.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
import '/widgets/tab_bar_widgets/sections/all_tasks_done_section.dart';

class DoneTaskScreen extends StatelessWidget {
  static const screenRoute = 'doneTaskScreen';

  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        tasks = tasks.where((element) => element.isDone == true).toList();

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            toolbarHeight: 60,
            title: const Text("Done Tasks"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, NewTaskScreen.screenRoute);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView(
            children: [
              // --
              (tasks.isNotEmpty)
                  ? TasksListSection(tasks, size)
                  : AllTasksDoneSection(size),
            ],
          ),
        );
      },
    );
  }
}
