import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/eventmodel.dart';

class EventMaker {
  static final EventController eventController = EventController();

  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static List<int> getTimeFromString(String timeString) {
    DateFormat timeFormat = DateFormat('h:mm');
    DateTime dateTime = timeFormat.parse(timeString);
    int hours = dateTime.hour;
    int minutes = dateTime.minute;
    return [hours, minutes];
  }

  static List<CalendarEventData> buildEventList(List<EventModel> event) {
    List<CalendarEventData> calendarEvents = [];
    for (var event in event) {
      calendarEvents.add(CalendarEventData(
        title: event.title,
        description: event.location,
        date: DateTime.parse(event.date),
        startTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            getTimeFromString(event.startTime).first,
            getTimeFromString(event.startTime).last),
        endTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            getTimeFromString(event.endTime).first,
            getTimeFromString(event.endTime).last),
      ));
    }
    return calendarEvents;
  }
}
