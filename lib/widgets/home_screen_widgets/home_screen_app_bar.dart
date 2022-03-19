import 'package:flutter/material.dart';
import 'package:things_to_do/utils/colors.dart';
import 'package:things_to_do/view/tasks_screens/new_task/new_task_screen.dart';

import '../shared_widgets/search_text_field.dart';

PreferredSizeWidget homeScreenAppBar(BuildContext context, setState) => AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      leading: Builder(
        builder: ((context) => InkWell(
              onTap: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              },
              child: Image.asset(
                "assets/icons/menubar.png",
                scale: 3.0,
              ),
            )),
      ),
      bottom: buildTabBar(context),
      title: Image.asset(
        "assets/logo/logo.png",
        width: 110,
        height: 26,
        fit: BoxFit.fill,
      ),
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
    );

PreferredSize buildTabBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 110),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: buildSearchTextField(context),
        ),
        const TabBar(
          isScrollable: false,
          indicatorColor: ThemeColors.whiteColor,
          unselectedLabelColor: ThemeColors.lightGreyColor,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          tabs: [
            Tab(child: Text("DAILY")),
            Tab(child: Text("WEEKLY")),
            Tab(child: Text("MONTHLY")),
          ],
        ),
      ],
    ),
  );
}
