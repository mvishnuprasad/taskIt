//import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/dataproviders.dart';

class EventMonthView extends ConsumerWidget {
  const EventMonthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDate = ref.watch(dateProvider.notifier);
    return ValueListenableBuilder<bool>(
      valueListenable: myBool,
      builder: (context, value, child) {
        return SizedBox(
            height: 400,
            child: TableCalendar(
              calendarFormat:
                  CalendarFormat.values[ref.watch(calendarView.notifier).state],
              shouldFillViewport: true,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              currentDay: selectedDate.state,
              rowHeight: 52,
              headerVisible: true,
              daysOfWeekStyle: const DaysOfWeekStyle(),
              headerStyle: HeaderStyle(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppThemeColors.highLight,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)))),
              onDaySelected: (selectedDay, focusedDay) {
                ref.read(dateProvider.notifier).state = selectedDay;
                selectedDay = focusedDay;
                myBool.value = !myBool.value;
              },
              calendarStyle: CalendarStyle(
                  selectedTextStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppThemeColors.highLight,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  defaultTextStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppThemeColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  selectedDecoration: BoxDecoration(
                      //shape: BoxShape.r,
                      color: AppThemeColors.highLight,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppThemeColors.highLight,
                    //borderRadius: const BorderRadius.all(Radius.circular(20))
                  )),
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, selectedDay, focusedDay) {
                  if (selectedDay == ref.read(dateProvider.notifier).state) {
                    final text = ref.read(dateProvider.notifier).state;
                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppThemeColors.highLight,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Center(
                        child: Text("${text}"),
                      ),
                    );
                  }
                },
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E().format(day);
                    return Center(
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                },
              ),
            ));
      },
    );
  }
}
