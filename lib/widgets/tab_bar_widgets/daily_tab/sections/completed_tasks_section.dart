// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';

class CompletedTasksSection extends StatefulWidget {
  CompletedTasksSection(this.base, this.box, this.doneTasks, {Key? key})
      : super(key: key);

  BaseWidget base;
  Box<Task> box;
  int doneTasks;

  @override
  State<CompletedTasksSection> createState() => _CompletedTasksSectionState();
}

class _CompletedTasksSectionState extends State<CompletedTasksSection> {
  @override
  Widget build(BuildContext context) {
    var tasks = widget.box.values.toList();

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

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: const BoxDecoration(
        color: ThemeColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                greeting(),
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              const Text(
                " Naser",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "TODAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryColor,
                    fontSize: 22),
              ),
              Text(
                "Completed",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.greenColor,
                    fontSize: 18),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                width: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.doneTasks}/",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.greenColor,
                          fontSize: 20),
                    ),
                    Text(
                      tasks.length.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.redColor,
                          fontSize: 20),
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
