import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/calendar/event_maker.dart';
import 'package:taskit/components/cards/text_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/pages/event_detail.dart';
import '../../constants/appconstants.dart';
import '../../main.dart';
import '../../models/eventmodel.dart';
import '../../pages/add_event.dart';
import '../../providers/dataproviders.dart';

class EventsView extends StatelessWidget {
  final int viewSelector;
  final double height;
  final double width;
  EventsView(
      {super.key,
      required this.viewSelector,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<EventModel>>(
      future: Hive.openBox<EventModel>('eventBox'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var eventsBox = snapshot.data!;
          var savedEvents = eventsBox.values.toList();
          // calendarEvents = buildEventList(savedEvents);
          EventMaker.eventController
              .addAll(EventMaker.buildEventList(savedEvents));
          return CalendarControllerProvider(
              controller: EventMaker.eventController,
              child: SizedBox(
                height: height * 0.5,
                child: () {
                  if (viewSelector == 1) {
                    return DayView(
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      width: width,
                      backgroundColor: AppThemeColors.background,
                      controller: EventMaker.eventController,
                      onDateTap: (time) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => const AddEvent(
                            eventTitle: "Add New Event",
                          ),
                        );
                      },
                      eventTileBuilder: (date, events, boundary, start, end) {
                        if (events.isNotEmpty) {
                          return ListView.builder(
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              int durationInMinutes =
                                  end.difference(start).inMinutes;
                              double containerHeight =
                                  durationInMinutes.toDouble() * 1.0;
                              return Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: AppThemeColors.highLight,
                                  ),
                                  margin: const EdgeInsets.only(left: 10),
                                  height: containerHeight,
                                  width: width / 1.5,
                                  child: Center(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxWidth: width / 1.6,
                                              maxHeight: containerHeight),
                                          child: TextView(
                                            title:
                                                "${event.title} starts from ${event.startTime?.hour} : ${event.startTime?.minute} ",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppThemeColors.background,
                                          ))),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("No Events to show"),
                          );
                        }
                      },
                      fullDayEventBuilder: (events, date) {
                        if (savedEvents.isNotEmpty) {
                          return ListView.builder(
                            itemCount: savedEvents.length,
                            itemBuilder: (context, index) {
                              final event = savedEvents[index];
                              // return Container(
                              //   height: 200,
                              //   width: width - 100,
                              //   color: AppThemeColors.primaryColor,
                              //   child: Text(event.title),
                              // );
                              return RoundedEventTile(
                                borderRadius: BorderRadius.circular(10.0),
                                title: event.title,
                                totalEvents: events.length - 1,
                                description: event.location,
                                padding: EdgeInsets.all(10.0),
                                backgroundColor: AppThemeColors.primaryColor,
                                margin: EdgeInsets.all(2.0),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                      showVerticalLine: false,
                      showLiveTimeLineInAllDays: true,
                      minDay: DateTime(1990),
                      maxDay: DateTime(2050),
                      initialDay: DateTime.now(),
                      heightPerMinute: 1,
                      onEventTap: (events, date) {
                        for (CalendarEventData event in events) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => EventDetail(
                              eventTitle: event.title,
                              eventTime:
                                  "${DateFormat('hh mm a').format(event.startTime!)} - ${DateFormat('hh mm a').format(event.endTime!)}",
                              eventLocation: "${event.description}",
                            ),
                          );
                        }
                      },
                      onEventDoubleTap: (events, date) => print(events),
                      onEventLongTap: (events, date) => print(events),
                      onDateLongPress: (date) => print(date),
                      startHour: 0,
                      endHour: 24,
                      timeLineOffset: 10,
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
                            padding:
                                const EdgeInsets.only(bottom: 5.0, left: 5),
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
                                        title:
                                            "${DateFormat('EEE').format(day)}",
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
                          return Container(
                            color: Colors.red,
                            height: 200,
                            child: Text("ffff"),
                          );
                        },
                        fullDayEventBuilder: (events, date) {
                          return Container(
                            color: Colors.red,
                            height: 200,
                            child: Text("ffff"),
                          );
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
                      cellBuilder: (day, List<CalendarEventData<Object?>> value,
                          bool, bool2, bool3) {
                        return Container(
                            decoration: BoxDecoration(
                              color: AppThemeColors.background,
                              border: DateFormat('dd').format(day) ==
                                      DateFormat('dd').format(DateTime.now())
                                  ? Border(
                                      bottom: BorderSide(
                                      color: AppThemeColors
                                          .highLight, // Border color
                                      width: DateFormat('MM').format(day) ==
                                              DateFormat('MM')
                                                  .format(DateTime.now())
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
                                          DateFormat('MM')
                                              .format(DateTime.now())
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
                      onPageChange: (date, pageIndex) =>
                          print("$date, $pageIndex"),
                      onCellTap: (events, date) {
                        // Implement callback when user taps on a cell.
                        print(events);
                      },
                      startDay: WeekDays
                          .sunday, // To change the first day of the week.
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
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
