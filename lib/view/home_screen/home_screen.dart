import 'package:flutter/material.dart';
import 'package:things_to_do/widgets/home_screen_widgets/drawer.dart';
import 'package:things_to_do/widgets/home_screen_widgets/home_screen_app_bar.dart';
import '/widgets/tab_bar_widgets/daily_tab/daily_todo_widget.dart';
import '/widgets/tab_bar_widgets/monthly_tab/monthly_todo_widget.dart';
import '/widgets/tab_bar_widgets/weekly_tab/weekly_todo_widget.dart';

class HomeScreen extends StatefulWidget {
  static const screenRoute = 'thingsToDoScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int doneTasks = 0;

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
          appBar: homeScreenAppBar(context, setState),
          drawer: buildDrawer(size, setState),
          body: TabBarView(
            children: [
              DailyTODOScreen(doneTasks),
              const WeeklyTODOScreen(),
              const MonthlyTODOScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
