import 'package:flutter/material.dart';
import 'package:things_to_do/utils/colors.dart';
import 'package:things_to_do/widgets/custom_circle.dart';
import 'package:things_to_do/widgets/search_text_field.dart';

import '../main.dart';
import '../models/task.dart';

class NewTaskScreen extends StatefulWidget {
  static const screenRoute = 'newTaskScreen';

  NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
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

  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  TextEditingController taskNotificationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskTitleController.text;
    taskDescriptionController.text;
    taskCategoryController.text;
    taskNotificationController.text;
  }

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          toolbarHeight: 60,
          title: const Text(
            "New Task",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              color: AppColors().primaryColor,
              child: buildSearchTextField(context),
            ),
            buildFieldText(
              text: "Task Name",
              controller: taskTitleController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  var task = Task.create(
                      taskTitle: value,
                      taskCategory: taskCategoryController.text);
                  base.dataStore.addTask(task: task);
                }
              },
            ),
            buildFieldText(
                text: "Description", controller: taskDescriptionController),
            buildFieldText(
                text: "Category", controller: taskCategoryController),
            Container(
              width: double.infinity,
              height: 60,
              color: AppColors().whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    color: AppColors().lightGreyColor,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Priority",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 60,
              color: AppColors().whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildPriorityCheckColors(
                    onTap: () {},
                    color: AppColors().redColor,
                  ),
                  buildPriorityCheckColors(
                    onTap: () {},
                    color: AppColors().orangeColor,
                  ),
                  buildPriorityCheckColors(
                    onTap: () {},
                    color: AppColors().blueColor,
                  ),
                  buildPriorityCheckColors(
                    onTap: () {},
                    color: AppColors().greenColor,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Divider(height: 0, color: Colors.grey.shade300, thickness: 1),
            buildFieldText(
                text: "Notification", controller: taskNotificationController),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                var task = Task.create(
                    taskTitle: taskTitleController.text,
                    taskCategory: taskCategoryController.text);
                base.dataStore.addTask(task: task);
                Navigator.pop(context);
              },
              child: const Text(
                "ADD",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPriorityCheckColors({
    required void Function()? onTap,
    required Color color,
  }) {
    return MaterialButton(
      minWidth: 25,
      onPressed: onTap,
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.4),
        radius: 10,
        child: buildCustomCircle(
          radius: 8,
          color: color,
        ),
      ),
    );
  }

  Widget buildFieldText({
    required String text,
    required TextEditingController? controller,
    void Function(String)? onSubmitted,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              fillColor: AppColors().whiteColor,
              filled: true,
              border: InputBorder.none,
              hintText: text,
              hintStyle: TextStyle(
                color: AppColors().lightGreyColor,
                fontSize: 14,
              )),
        ),
        Divider(
          height: 0,
          color: Colors.grey.shade300,
          thickness: 1,
        ),
      ],
    );
  }
}
