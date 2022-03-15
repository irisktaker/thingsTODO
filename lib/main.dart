import 'package:flutter/material.dart';
import 'package:things_to_do/screens/important_tasks_screen.dart';
import 'package:things_to_do/screens/later_task_screen.dart';
import 'package:things_to_do/screens/new_task_screen.dart';
import 'package:things_to_do/screens/things_to_do_screen.dart';
import 'package:things_to_do/utils/colors.dart';

import 'screens/done_task_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThingsTODO',
      theme: ThemeData(
        primaryColor: AppColors().primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors().primaryColor,
          elevation: 0,
          centerTitle: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors().primaryColor,
            onPrimary: AppColors().whiteColor,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        ThingsToDoScreen.screenRoute: (context) => const ThingsToDoScreen(),
        NewTaskScreen.screenRoute: (context) => const NewTaskScreen(),
        ImportantTaskScreen.screenRoute: (context) =>
            const ImportantTaskScreen(),
        DoneTaskScreen.screenRoute: (context) => const DoneTaskScreen(),
        LaterTaskScreen.screenRoute: (context) => const LaterTaskScreen(),
      },
    );
  }
}
