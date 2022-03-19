// ignore_for_file: must_be_immutable

import 'dart:math' as math;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/widgets/shared_widgets/custom_circle.dart';
import '/view/tasks_screens/edit_task/edit_task_screen.dart';
import '/view/tasks_screens/later_tasks/later_task_screen.dart';

class TasksListSection extends StatefulWidget {
  TasksListSection(this.size, this.base, this.box, this.tasks, this.doneTasks,
      this.doneTasksFun,
      {Key? key})
      : super(key: key);

  Size size;
  BaseWidget base;
  Box<Task> box;
  List<Task> tasks;
  int doneTasks;
  Function(int doneTasks) doneTasksFun;

  @override
  State<TasksListSection> createState() => _TasksListSectionState();
}

class _TasksListSectionState extends State<TasksListSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: widget.size.width,
        height: 500,
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (context, index) {
            //..
            var task = widget.tasks[index];

            return InkWell(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Do you want to edit the task?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              //TO_DO: Handle Edit
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, EditTakScreen.screenRoute);
                            },
                            child: const Text('Edit'),
                          )
                        ],
                      );
                    });
              },
              child: Slidable(
                key: Key(task.id),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    SlidableAction(
                      onPressed: ((context) {
                        setState(() {
                          widget.doneTasksFun(++widget.doneTasks);
                          task.save();
                        });
                      }),
                      backgroundColor: ThemeColors.blueColor,
                      foregroundColor: ThemeColors.whiteColor,
                      icon: Icons.done,
                      label: 'Done',
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        task.save();
                      }),
                      backgroundColor: ThemeColors.greenColor,
                      foregroundColor: ThemeColors.whiteColor,
                      icon: Icons.save_alt_outlined,
                      label: 'Save',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        task.id;
                        Navigator.pushNamed(
                            context, LaterTaskScreen.screenRoute);
                        task.delete();
                      },
                      backgroundColor: ThemeColors.orangeColor,
                      foregroundColor: ThemeColors.whiteColor,
                      icon: Icons.watch_later_outlined,
                      label: 'Later',
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        widget.base.dataStore.deleteTask(task: task);
                      }),
                      backgroundColor: ThemeColors.redColor,
                      foregroundColor: ThemeColors.whiteColor,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Container(
                  width: widget.size.width,
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ThemeColors.whiteColor,
                      border: Border.all(
                        color: ThemeColors.lightGreyColor.withOpacity(0.5),
                      )),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('kk:mm \n a').format(task.createdAt),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      task.taskTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.greyColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                    subtitle: Text(
                      task.taskCategory,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // --
                          StatefulBuilder(
                            builder: ((context, setState) => IconButton(
                                  onPressed: () {
                                    setState(() {
                                      task.isFavorite = !task.isFavorite;
                                    });
                                  },
                                  icon: task.isFavorite
                                      ? const Icon(
                                          Icons.star,
                                          color: ThemeColors.yellowColor,
                                          size: 26,
                                        )
                                      : const Icon(
                                          Icons.star_border_outlined,
                                          size: 26,
                                        ),
                                )),
                          ),
                          buildCustomCircle(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
