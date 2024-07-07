import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppThemeColors {
  static Color primaryColor = const Color(0xff005c78);
  static Color secondaryColor = const Color(0xff006989);
  static Color background = const Color(0xfffffaf2);
  static Color shadow = const Color(0xffbdc0b7);
  static Color highLight = const Color(0xfff38154);
}

class CalendarTitles {
  static int getWeekNumber(DateTime date) {
    int daysToAdd = DateTime.thursday - date.weekday;
    DateTime thursdayDate = daysToAdd > 0 ? date.add(Duration(days: daysToAdd)) : date.subtract(Duration(days: daysToAdd.abs()));
    int dayOfYearThursday = dayOfYear(thursdayDate);
    return 1 + ((dayOfYearThursday - 1) / 7).floor();
  }
  static int dayOfYear(DateTime date) {
    return date.difference(DateTime(date.year, 1, 1)).inDays;
  }

  static String weekDayCalculator() {
    DateTime startOfWeek =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    DateFormat formatter = DateFormat('dd MMM');
    DateFormat dateFormatter = DateFormat('dd');
    String formattedStart = dateFormatter.format(startOfWeek);
    String formattedEnd = formatter.format(endOfWeek);
    return "$formattedStart to $formattedEnd";
  }

  static List<String> titles = [
    "This Month",
    "Today",
    "This Week",
  ];
  static List<String> dateValues = [
    DateFormat('MMMM').format(DateTime.now()),
    DateFormat('EEE d').format(DateTime.now()),
    weekDayCalculator()
  ];
}
