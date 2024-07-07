
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskit/components/cards/task_card.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/dataproviders.dart';

class CalendarView extends ConsumerWidget {
  final double height;

  const CalendarView(this.height, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.sizeOf(context).width;
    var selectedDate = ref.watch(dateProvider.notifier);
    var viewOption = ref.watch(calendarView.notifier);
    return ValueListenableBuilder<bool>(
      valueListenable: myBool,
      builder: (context, value, child) {
        return () {
          if (viewOption.state == 2 || viewOption.state == 0) {
            return SizedBox(
                height: viewOption.state == 2 ? height * 0.21 : height * 0.5,
                child: TableCalendar(
                  calendarFormat: CalendarFormat.values[viewOption.state],
                  availableCalendarFormats: const {
                    CalendarFormat.twoWeeks: '2 weeks',
                    CalendarFormat.week: 'Week',
                    CalendarFormat.month: 'Month',
                  },
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
                      if (selectedDay ==
                          ref.read(dateProvider.notifier).state) {
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
          } else {
            return SizedBox(
                height: height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TaskCard(width: width, task: 'Tasks', height: height, number: 08,),
                    TaskCard(width: width, task: 'Events', height: height, number: 02,),
                    //TodayDate()
                  ],
                ));
          }
        }();
      },
    );
  }
}
