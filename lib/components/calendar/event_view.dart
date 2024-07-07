import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/cards/text_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/appconstants.dart';

class EventsView extends StatelessWidget {
  final int viewSelector;
  final double height;
  final double width;
  const EventsView(
      {super.key,
      required this.viewSelector,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
        controller: EventController(),
        child: SizedBox(
          height: height * 0.5,
          child: () {
            if (viewSelector == 1) {
              return DayView(
                width: width,
                backgroundColor: AppThemeColors.background,
                controller: EventController(),
                eventTileBuilder: (date, events, boundry, start, end) {
                  // Return your widget to display as event tile.
                  return Container();
                },
                fullDayEventBuilder: (events, date) {
                  return Container();
                },

                showVerticalLine: false,
                showLiveTimeLineInAllDays: true,
                minDay: DateTime(1990),
                maxDay: DateTime(2050),
                initialDay: DateTime.now(),
                heightPerMinute: 1,
                eventArranger: SideEventArranger(),
                onEventTap: (events, date) => print(events),
                onEventDoubleTap: (events, date) => print(events),
                onEventLongTap: (events, date) => print(events),
                onDateLongPress: (date) => print(date),
                startHour: 5,
                endHour: 20,
                timeLineOffset: 20,
                // hourLinePainter: (lineColor, lineHeight, offset, minuteHeight, showVerticalLine, verticalLineOffset) {
                //   return //Your custom painter.
                // },

                headerStyle: HeaderStyle(
                    leftIcon: Icon(
                      Icons.chevron_left,
                      color: AppThemeColors.highLight,
                    ),
                    rightIcon: Icon(
                      Icons.chevron_right,
                      color: AppThemeColors.highLight,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppThemeColors.background,
                    ),
                    headerTextStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppThemeColors.highLight,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),

                timeLineBuilder: (time) {
                  return TextView(
                    title: DateFormat('hh:mm a').format(time),
                    fontSize: 13,
                    color: AppThemeColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  );
                },
                dateStringBuilder: (time, {DateTime? secondaryDate}) {
                  return DateFormat('dd MMMM yyyy').format(time);
                },
                keepScrollOffset: true,
              );
            } else if (viewSelector == 2) {
              return SizedBox(
                child: WeekView(
                  controller: EventController(),
                  backgroundColor: AppThemeColors.background,
                  emulateVerticalOffsetBy: 10,

                  showLiveTimeLineInAllDays: false,
                  width: width - 40,
                  minDay: DateTime(1990),
                  maxDay: DateTime(2050),
                  initialDay: DateTime.now(),
                  heightPerMinute: 1.2,
                  eventArranger: const SideEventArranger(),
                  onEventTap: (events, date) => print(events),
                  onEventDoubleTap: (events, date) => print(events),
                  onDateLongPress: (date) => print(date),
                  startDay: WeekDays.sunday,
                  startHour: 5,
                  endHour: 20,
                  showVerticalLines: false,
                  timeLineOffset: 20,
                  weekNumberBuilder: (date) {
                    return TextView(
                      title: "${CalendarTitles.getWeekNumber(date)}",
                      color: AppThemeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    );
                  },

                  weekDayBuilder: (day) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, left: 5),
                      child: Center(
                        child: Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              //color: AppThemeColors.highLight,
                            ),
                            child: Column(
                              children: [
                                TextView(
                                  title: "${day.day}",
                                  fontSize: 14,
                                  color: AppThemeColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextView(
                                  title: "${DateFormat('EEE').format(day)}",
                                  fontSize: 12,
                                  color: AppThemeColors.highLight,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  eventTileBuilder: (date, events, boundry, start, end) {
                    return Container();
                  },
                  fullDayEventBuilder: (events, date) {
                    return Container();
                  },
                  timeLineBuilder: (time) {
                    return TextView(
                      title: DateFormat('hh:mm a').format(time),
                      fontSize: 13,
                      color: AppThemeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    );
                  },
                  weekPageHeaderBuilder: WeekHeader.hidden,
                  //fullDayHeaderTitle: '[;l[pl',
                  fullDayHeaderTextConfig: const FullDayHeaderTextConfig(
                    textAlign: TextAlign.center,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ), // To set full day events header text config
                  keepScrollOffset: true,
                ),
              );
            } else if (viewSelector == 0) {
              return MonthView(
                hideDaysNotInMonth: true,
                showBorder: true,
                borderColor: AppThemeColors.highLight.withOpacity(0.6),
                borderSize: BorderSide.strokeAlignCenter,
                cellBuilder: (day, List<CalendarEventData<Object?>> value, bool,
                    bool2, bool3) {
                  return Container(
                      decoration: BoxDecoration(
                        color: AppThemeColors.background,
                        border: DateFormat('dd').format(day) ==
                                DateFormat('dd').format(DateTime.now())
                            ? Border(
                                bottom: BorderSide(
                                color: AppThemeColors.highLight, // Border color
                                width: DateFormat('MM').format(day) ==
                                        DateFormat('MM').format(DateTime.now())
                                    ? 10.0
                                    : 0, // Border width
                              ))
                            : null,
                      ),
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          TextView(
                            title: DateFormat('MM').format(day) ==
                                    DateFormat('MM').format(DateTime.now())
                                ? DateFormat('dd').format(day)
                                : "",
                            color: DateFormat('EEE').format(day) == "Sun"
                                ? Colors.red
                                : AppThemeColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )
                        ],
                      ));
                },
                controller: EventController(),
                // to provide custom UI for month cells.
                // cellBuilder: (date, events, isToday, isInMonth) {
                //   // Return your widget to display as month cell.
                //   return Container();
                // },
                minMonth: DateTime(1990),
                maxMonth: DateTime(2050),
                initialMonth: DateTime.now(),
                cellAspectRatio: 0.5,
                onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
                onCellTap: (events, date) {
                  // Implement callback when user taps on a cell.
                  print(events);
                },
                startDay:
                    WeekDays.sunday, // To change the first day of the week.
                // This callback will only work if cellBuilder is null.
                onEventTap: (event, date) => print(event),
                onEventDoubleTap: (events, date) => print(events),
                onEventLongTap: (event, date) => print(event),
                onDateLongPress: (date) => print(date),
                headerStyle: HeaderStyle(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppThemeColors.background,
                    ),
                    headerTextStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppThemeColors.highLight,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                headerStringBuilder: (time, {DateTime? secondaryDate}) {
                  return DateFormat('MMMM yyyy').format(time);
                },

                headerBuilder: (time, {DateTime? secondaryDate}) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppThemeColors.background,
                    ),
                    child: Center(
                      child: TextView(
                        title: DateFormat('MMMM yyyy').format(time),
                        fontSize: 18,
                        color: AppThemeColors.highLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                weekDayBuilder: (day) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: AppThemeColors.background,
                    ),
                    child: Center(
                      child: TextView(
                        title: DateFormat.E()
                            .format(DateTime.utc(2024, 7, 8 + day))
                            .substring(0, 1),
                        fontSize: 18,
                        color: AppThemeColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                showWeekTileBorder: false,
              );
            }
          }(),
        ));
  }
}
