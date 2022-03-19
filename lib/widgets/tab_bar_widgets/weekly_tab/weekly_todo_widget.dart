import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '/utils/colors.dart';

class WeeklyTODOScreen extends StatelessWidget {
  const WeeklyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: SfCalendar(
            view: CalendarView.week,
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
              textStyle: TextStyle(color: ThemeColors.blackColor, fontSize: 20),
            ),
            cellBorderColor: ThemeColors.primaryColor,
            backgroundColor: ThemeColors.primaryColor,
            todayHighlightColor: ThemeColors.whiteColor,
            showDatePickerButton: false,
            todayTextStyle: const TextStyle(
              color: ThemeColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
