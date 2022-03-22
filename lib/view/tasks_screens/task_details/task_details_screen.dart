import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:things_to_do/models/task.dart';

import '/utils/colors.dart';
import '/view/tasks_screens/new_task/new_task_screen.dart';
import '/widgets/shared_widgets/search_text_field.dart';

class TaskDetailsScreen extends StatelessWidget {
  static const screenRoute = 'taskDetailScreen';

  TaskDetailsScreen(this.tasks, this.task, this.size, {Key? key})
      : super(key: key);

  List<Task> tasks;
  Task task;
  Size size;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        title: const Text("Task Details"),
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
      body: Stack(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            color: ThemeColors.primaryColor,
            child: buildSearchTextField(context),
          ),
          Container(
            height: 380,
            width: size.width,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: ThemeColors.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.taskTitle,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "${DateFormat.yMMMd().format(task.taskFinalDate)} | ${DateFormat('kk:mm a').format(task.createdAt)}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: ThemeColors.lightGreyColor,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  task.taskDesc,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ThemeColors.greyColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Category: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      task.taskCategory,
                      style: const TextStyle(
                          fontSize: 14, color: ThemeColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: ThemeColors.whiteColor,
        selectedItemColor: ThemeColors.primaryColor,
        unselectedItemColor: ThemeColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.delete_outline), label: 'Delete'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in), label: 'Done'),
        ],
      ),
    );
  }
}
