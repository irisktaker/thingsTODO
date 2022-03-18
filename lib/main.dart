import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:things_to_do/screens/important_tasks_screen.dart';
import 'package:things_to_do/screens/later_task_screen.dart';
import 'package:things_to_do/screens/new_task_screen.dart';
import 'package:things_to_do/screens/home_screen.dart';
import 'package:things_to_do/utils/colors.dart';

import 'database/hive_data_store.dart';
import 'models/task.dart';
import 'screens/done_task_screen.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  var box = await Hive.openBox<Task>('tasks');

  box.values.forEach((task) {
    if (task.createdAt.day != DateTime.now().day) {
      box.delete(task.id);
    }
  });

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
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
        HomeScreen.screenRoute: (context) => const HomeScreen(),
        NewTaskScreen.screenRoute: (context) => const NewTaskScreen(),
        ImportantTaskScreen.screenRoute: (context) =>
            const ImportantTaskScreen(),
        DoneTaskScreen.screenRoute: (context) => const DoneTaskScreen(),
        LaterTaskScreen.screenRoute: (context) => const LaterTaskScreen(),
      },
    );
  }
}
