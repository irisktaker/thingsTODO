import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '../sections/all_tasks_done_section.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';

class MonthlyTODOScreen extends StatelessWidget {
  const MonthlyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        tasks = tasks
            .where(
              (element) =>
                  element.taskFinalDate.day > element.createdAt.weekday,
            )
            .toList();

        return ListView(
          children: [
            // --
            Container(
              // height: 110,
              margin: const EdgeInsets.only(bottom: 16),
              child: SfCalendar(
                view: CalendarView.month,
                timeSlotViewSettings: const TimeSlotViewSettings(
                  startHour: 0,
                  endHour: 0,
                ),
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                headerHeight: 45,
                headerDateFormat: "MMM, yyy",
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: ThemeColors.whiteColor,
                  textStyle:
                      TextStyle(color: ThemeColors.blackColor, fontSize: 20),
                ),
                cellBorderColor: Colors.transparent,
                backgroundColor: ThemeColors.whiteColor,
                todayHighlightColor: ThemeColors.whiteColor,
                showDatePickerButton: false,
                todayTextStyle: const TextStyle(
                  color: ThemeColors.blackColor,
                ),
              ),
            ),

            // --
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // --
            (tasks.isNotEmpty)
                ? TasksListSection(tasks, size)
                : AllTasksDoneSection(tasks, size),
          ],
        );
      },
    );
  }
}
