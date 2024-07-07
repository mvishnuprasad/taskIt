import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/textviews/text_view.dart';

class AppThemeColors {
  static Color primaryColor = const Color(0xff005c78);
  static Color secondaryColor = const Color(0xff006989);
  static Color background = const Color(0xfffffaf2);
  static Color shadow = const Color(0xffbdc0b7);
  static Color highLight = const Color(0xfff38154);
}

class CalendarTitles {
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
