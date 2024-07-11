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

class WeekViewWidget extends StatelessWidget {
  final double width;
  final List<EventModel> savedEvents;
  const WeekViewWidget({super.key, required this.width, required this.savedEvents});

  @override
  Widget build(BuildContext context) {
    return  WeekView(
      controller: EventMaker.eventController,
      backgroundColor: AppThemeColors.background,
      emulateVerticalOffsetBy: 10,

      showLiveTimeLineInAllDays: false,
      width: width - 40,
      minDay: DateTime(1990),
      maxDay: DateTime(2050),
      initialDay: DateTime.now(),
      heightPerMinute: 1.2,
      eventArranger: const SideEventArranger(),
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
      onDateLongPress: (date) => print(date),
      onDateTap: (DateTime date){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const AddEvent(
            eventTitle: "Add New Event",
          ),
        );
      },
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
                  //borderRadius: BorderRadius.circular(5),
                  border: DateFormat('dd').format(day) ==
                      DateFormat('dd').format(DateTime.now())
                      ? Border(
                      bottom: BorderSide(
                        color: AppThemeColors.primaryColor, // Border color
                        width: DateFormat('MM').format(day) ==
                            DateFormat('MM').format(DateTime.now())
                            ? 5.0
                            : 0, // Border width
                      ))
                      : null,
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
        return Container(
          color: Colors.red,
          height: 200,
          child: const Text("Test"),
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
    );
  }
}
