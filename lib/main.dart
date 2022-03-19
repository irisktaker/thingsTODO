import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'database/hive_data_store.dart';
import '/utils/colors.dart';
import 'models/task.dart';
import 'view/home_screen/home_screen.dart';
import 'view/login_screen/login_screen.dart';
import 'view/tasks_screens/done_task/done_task_screen.dart';
import 'view/tasks_screens/edit_task/edit_task_screen.dart';
import 'view/tasks_screens/important_tasks/important_tasks_screen.dart';
import 'view/tasks_screens/later_tasks/later_task_screen.dart';
import 'view/tasks_screens/new_task/new_task_screen.dart';

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
        primaryColor: ThemeColors.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.primaryColor,
          elevation: 0,
          centerTitle: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.primaryColor,
            onPrimary: ThemeColors.whiteColor,
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
        EditTakScreen.screenRoute: (context) => const EditTakScreen(),
      },
    );
  }
}
