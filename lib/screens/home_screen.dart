import 'package:flutter/material.dart';
import 'package:things_to_do/screens/done_task_screen.dart';
import 'package:things_to_do/screens/important_tasks_screen.dart';
import 'package:things_to_do/screens/later_task_screen.dart';
import 'package:things_to_do/screens/new_task_screen.dart';
import 'package:things_to_do/widgets/daily_todo_screen.dart';
import 'package:things_to_do/widgets/monthly_todo_screen.dart';
import 'package:things_to_do/widgets/weekly_todo_screen.dart';
import 'package:things_to_do/utils/colors.dart';

import '../widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  static const screenRoute = 'thingsToDoScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
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
          ),
          drawer: buildDrawer(size),
          body: const TabBarView(
            children: [
              DailyTODOScreen(),
              WeeklyTODOScreen(),
              MonthlyTODOScreen(),
            ],
          ),
        ),
      ),
    );
  }

  bool onTap = false;
  // bool onDoubleTap = false;
  Drawer buildDrawer(Size size) => Drawer(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 200,
              color: AppColors().primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      onTap = !onTap;
                    },
                    onDoubleTap: () {},
                    child: CircleAvatar(
                      backgroundColor: onTap ? Colors.amber : null,
                      radius: 50,
                      child: CircleAvatar(
                        backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1647281536088-569165944e97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
                        ),
                        radius: onTap ? 45 : 50,
                      ),
                    ),
                  ),
                  Text(
                    "Naser Sami",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors().whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
                child: ListView.builder(
                  itemCount: drawerList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, drawerList[index]['screen']);
                    },
                    child: ListTile(
                      leading: Icon(
                        drawerList[index]['icon'],
                        size: 30,
                      ),
                      title: Text(
                        drawerList[index]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors().greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
          TabBar(
            isScrollable: false,
            indicatorColor: AppColors().whiteColor,
            unselectedLabelColor: AppColors().lightGreyColor,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(child: Text("DAILY")),
              Tab(child: Text("WEEKLY")),
              Tab(child: Text("MONTHLY")),
            ],
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> drawerList = [
  {
    'icon': Icons.add,
    'title': "New Task",
    'screen': NewTaskScreen.screenRoute,
  },
  {
    'icon': Icons.star_border_outlined,
    'title': "Important",
    'screen': ImportantTaskScreen.screenRoute,
  },
  {
    'icon': Icons.done,
    'title': "Done",
    'screen': DoneTaskScreen.screenRoute,
  },
  {
    'icon': Icons.watch_later_outlined,
    'title': "Later",
    'screen': LaterTaskScreen.screenRoute,
  },
  {
    'icon': Icons.category_outlined,
    'title': "Category",
    'screen': NewTaskScreen.screenRoute,
  },
  {
    'icon': Icons.settings,
    'title': "Settings",
    'screen': NewTaskScreen.screenRoute,
  },
  {
    'icon': Icons.logout,
    'title': "Logout",
    'screen': '/',
  },
];
