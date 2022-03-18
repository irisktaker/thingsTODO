import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:things_to_do/screens/edit_task_screen.dart';
import 'package:things_to_do/screens/later_task_screen.dart';

import 'package:things_to_do/utils/colors.dart';

import '../main.dart';
import '../models/task.dart';
import '../screens/edit_task_screen.dart';
import 'custom_circle.dart';

class DailyTODOScreen extends StatefulWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  int doneTasks = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final base = BaseWidget.of(context);
    final box = base.dataStore.box;

    return ListView(
      children: [
        buildCompletedTasksSection(base, box),
        ValueListenableBuilder(
          valueListenable: base.dataStore.listenToTasks(),
          builder: (BuildContext context, Box<Task> box, Widget? child) {
            var tasks = box.values.toList();
            tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

            if (tasks.isNotEmpty) {
              return SizedBox(
                width: size.width,
                height: size.height,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    var task = tasks[index];

                    return InkWell(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:
                                    const Text('Do you want to edit the task?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
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
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: [
                              SlidableAction(
                                onPressed: ((context) {
                                  setState(() {
                                    doneTasks++;
                                    task.save();
                                  });
                                }),
                                backgroundColor: AppColors().blueColor,
                                foregroundColor: AppColors().whiteColor,
                                icon: Icons.done,
                                label: 'Done',
                              ),
                              SlidableAction(
                                onPressed: ((context) {
                                  task.save();
                                }),
                                backgroundColor: AppColors().greenColor,
                                foregroundColor: AppColors().whiteColor,
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
                                backgroundColor: AppColors().orangeColor,
                                foregroundColor: AppColors().whiteColor,
                                icon: Icons.watch_later_outlined,
                                label: 'Later',
                              ),
                              SlidableAction(
                                onPressed: ((context) {
                                  base.dataStore.deleteTask(task: task);
                                }),
                                backgroundColor: AppColors().redColor,
                                foregroundColor: AppColors().whiteColor,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: Container(
                            width: size.width,
                            height: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors().whiteColor,
                                border: Border.all(
                                  color: AppColors()
                                      .lightGreyColor
                                      .withOpacity(0.5),
                                )),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('kk:mm \n a')
                                        .format(task.createdAt),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors().greyColor,
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(
                                task.taskTitle,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors().greyColor,
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
                                      builder: ((context, setState) =>
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                task.isFavorite =
                                                    !task.isFavorite;
                                              });
                                            },
                                            icon: task.isFavorite
                                                ? Icon(
                                                    Icons.star,
                                                    color:
                                                        AppColors().yellowColor,
                                                    size: 26,
                                                  )
                                                : const Icon(
                                                    Icons.star_border_outlined,
                                                    size: 26,
                                                  ),
                                          )),
                                    ),
                                    buildCustomCircle(
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                ),
              );
            } else {
              return SizedBox(
                height: size.height * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.height * 0.30,
                      child: Image.asset(
                        "assets/images/img2.png",
                      ),
                    ),
                    Text(
                      "All Done For Now",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors().primaryColor,
                      ),
                    ),
                    Text(
                      "Next Task",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors().greyColor.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      "Tomorrow 3:55 PM",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors().greyColor.withOpacity(0.6),
                      ),
                    ),
                    const Text(
                      "Time for a Break",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildCompletedTasksSection(BaseWidget base, Box<Task> box) {
    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      }
      if (hour < 17) {
        return 'Good Afternoon';
      }
      return 'Good Evening';
    }

    return StatefulBuilder(builder: (context, setState) {
      // final base = BaseWidget.of(context);
      // final box = base.dataStore.box;
      var tasks = box.values.toList();

      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        height: 130,
        decoration: BoxDecoration(
          color: AppColors().whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  greeting(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
                const Text(
                  " Naser",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TODAY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors().primaryColor,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Completed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors().greenColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  width: 90.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$doneTasks/",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors().greenColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        tasks.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors().redColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
