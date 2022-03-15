import 'package:flutter/material.dart';
import 'package:things_to_do/widgets/daily_todo_screen.dart';
import 'package:things_to_do/widgets/monthly_todo_screen.dart';
import 'package:things_to_do/widgets/weekly_todo_screen.dart';
import 'package:things_to_do/utils/colors.dart';

class ThingsToDoScreen extends StatefulWidget {
  static const screenRoute = 'thingsToDoScreen';

  const ThingsToDoScreen({Key? key}) : super(key: key);

  @override
  State<ThingsToDoScreen> createState() => _ThingsToDoScreenState();
}

class _ThingsToDoScreenState extends State<ThingsToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            toolbarHeight: 60,
            leading: InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/menubar.png",
                scale: 3.0,
              ),
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
                  Icons.add,
                ),
              ),
            ],
          ),
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
            child: buildTextField(context),
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

  TextField buildTextField(BuildContext context) {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icons/search.png",
            scale: 3,
          ),
        ),
        fillColor: AppColors().whiteColor,
        filled: true,
        hintText: 'Search Task',
        hintStyle: TextStyle(
          color: AppColors().lightGreyColor,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: TextStyle(
        color: AppColors().blackColor,
      ),
    );
  }
}
