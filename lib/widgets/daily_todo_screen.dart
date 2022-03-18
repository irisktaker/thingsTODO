import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:things_to_do/utils/colors.dart';

import '../main.dart';
import '../models/task.dart';
import 'custom_circle.dart';

class DailyTODOScreen extends StatefulWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // DateTime now = DateTime.now();
    // String timeNow = DateFormat('kk:mm \n a').format(now);

    final base = BaseWidget.of(context);
    final box = base.dataStore.box;

    return ListView(
      children: [
        buildCompletedTasksSection(),
        ValueListenableBuilder(
          valueListenable: base.dataStore.listenToTasks(),
          builder: (BuildContext context, Box<Task> box, Widget? child) {
            var tasks = box.values.toList();
            tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

            return SizedBox(
              width: size.width,
              height: size.height,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  var task = tasks[index];

                  return Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: ((context) {
                              // Singleton.instance.newTaskDataList[index].isDone =
                              //     !Singleton.instance.newTaskDataList[index].isDone;
                            }),
                            backgroundColor: AppColors().greenColor,
                            foregroundColor: AppColors().whiteColor,
                            icon: Icons.done,
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
                              // Singleton.instance.newTaskDataList[index].isLater =
                              //     !Singleton.instance.newTaskDataList[index].isLater;
                            },
                            backgroundColor: AppColors().redColor,
                            foregroundColor: AppColors().whiteColor,
                            icon: Icons.watch_later_outlined,
                            label: 'Later',
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
                              color:
                                  AppColors().lightGreyColor.withOpacity(0.5),
                            )),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('kk:mm \n a').format(task.createdAt),
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
                                  builder: ((context, setState) => IconButton(
                                        onPressed: () {
                                          setState(() {
                                            task.isFavorite = !task.isFavorite;
                                          });
                                        },
                                        icon: task.isFavorite
                                            ? Icon(
                                                Icons.star,
                                                color: AppColors().yellowColor,
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
                      ));
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Container buildCompletedTasksSection() {
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
                "Good Morning ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
              const Text(
                "Naser",
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
                      "4/",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors().greenColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "10",
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
  }
}
