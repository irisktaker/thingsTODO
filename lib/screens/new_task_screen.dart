import 'package:flutter/material.dart';
import 'package:things_to_do/utils/colors.dart';
import 'package:things_to_do/widgets/custom_circle.dart';
import 'package:things_to_do/widgets/search_text_field.dart';

class NewTaskScreen extends StatelessWidget {
  static const screenRoute = 'newTaskScreen';

  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ),
            buildFieldText(text: "Description"),
            buildFieldText(
              text: "Category",
            ),
            buildFieldText(
              text: "Pick Date & Time",
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
                  Spacer(),
                ],
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            buildFieldText(
              text: "Notification",
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
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
  }) {
    return Column(
      children: [
        TextField(
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
