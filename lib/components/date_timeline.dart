import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:taskit/constants/appconstants.dart';


class CalendarTimeLine extends StatefulWidget {
  const CalendarTimeLine({super.key});

  @override
  State<CalendarTimeLine> createState() => _CalendarTimeLineState();
}

class _CalendarTimeLineState extends State<CalendarTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DatePicker(
          daysCount: 500,
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
          height: 90,
          width: 60,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppThemeColors.highLight,
          selectedTextColor: AppThemeColors.background,
          onDateChange: (date) {
            // New date selected
            setState(() {
              // _selectedValue = date;
              debugPrint("$date");
            });
          },
        ),
      ],
    );
  }
}
