import 'package:flutter/material.dart';

import 'new_task_screen.dart';
import '/utils/colors.dart';
import '../widgets/search_text_field.dart';

class DoneTaskScreen extends StatelessWidget {
  static const screenRoute = 'doneTaskScreen';

  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        title: const Text("Done Tasks"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NewTaskScreen.screenRoute);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 80,
              padding: const EdgeInsets.all(16),
              color: AppColors().primaryColor,
              child: buildSearchTextField(context)),
          Center(
            child: Text("DoneTaskScreen"),
          ),
        ],
      ),
    );
  }
}
