import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskit/components/cards/task_card.dart';
import 'package:taskit/components/cards/text_view.dart';
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
                  focusedDay: selectedDate.state,
                  currentDay: selectedDate.state,
                  rowHeight: 52,
                  headerVisible: true,
                  headerStyle: HeaderStyle(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppThemeColors.highLight,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      titleTextFormatter: (time, value) {
                        return DateFormat('MMMM yyyy').format(time);
                      },
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: AppThemeColors.background,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: AppThemeColors.background,
                      ),
                      titleTextStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppThemeColors.background,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      formatButtonShowsNext: false,
                      formatButtonTextStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppThemeColors.background,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      formatButtonDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: AppThemeColors.background,
                          ))),
                  onDaySelected: (selectedDay, focusedDay) {
                    selectedDate.state = selectedDay;
                    // selectedDay = focusedDay;
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
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, date) {
                      if (day.weekday == DateTime.sunday) {
                        return Center(
                          child: TextView(
                            title: DateFormat('dd').format(day),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return Center(
                          child: TextView(
                            title: DateFormat('dd').format(day),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppThemeColors.primaryColor,
                          ),
                        );
                      }
                    },
                    todayBuilder: (context, day, date) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppThemeColors.primaryColor,
                          ),
                          child: TextView(
                            title: DateFormat('dd').format(day),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppThemeColors.background,
                          ),
                        ),
                      );
                    },
                    dowBuilder: (context, day) {
                      final weekday = DateFormat.E().format(day);
                      if (weekday == "Sun") {
                        return Center(
                          child: Text(
                            weekday,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            weekday,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppThemeColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
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
                    TaskCard(
                      width: width,
                      task: 'Tasks',
                      height: height,
                      number: 08,
                    ),
                    TaskCard(
                      width: width,
                      task: 'Events',
                      height: height,
                      number: 02,
                    ),
                    //TodayDate()
                  ],
                ));
          }
        }();
      },
    );
  }
}
