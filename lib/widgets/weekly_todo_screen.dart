import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:things_to_do/utils/colors.dart';

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
            headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: AppColors().whiteColor,
              textStyle: TextStyle(color: AppColors().blackColor, fontSize: 20),
            ),
            cellBorderColor: AppColors().primaryColor,
            backgroundColor: AppColors().primaryColor,
            todayHighlightColor: AppColors().whiteColor,
            showDatePickerButton: false,
            todayTextStyle: TextStyle(
              color: AppColors().blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
