import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskit/models/eventmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/appconstants.dart';
import '../../../pages/add_event.dart';
import '../../../pages/event_detail.dart';
import '../../cards/text_view.dart';
import '../event_maker.dart';

class DayViewWidget extends StatelessWidget {
  final double width;
  final List<EventModel> savedEvents;
  const DayViewWidget({super.key, required this.width, required this.savedEvents});

  @override
  Widget build(BuildContext context) {
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
              int durationInMinutes = end.difference(start).inMinutes;
              double containerHeight = durationInMinutes.toDouble() * 1.0;
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                padding: const EdgeInsets.all(10.0),
                backgroundColor: AppThemeColors.primaryColor,
                margin: const EdgeInsets.all(2.0),
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
  }
}
