import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:taskit/providers/dataproviders.dart';


class CalendarTimeLine extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
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

              // _selectedValue = date;
            ref.read(dateProvider.notifier).state = date;


              debugPrint("$date");

          },
        ),
      ],
    );
  }
}
