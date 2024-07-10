import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/calendar/event_maker.dart';
import 'package:taskit/components/calendar/event_views/day_view.dart';
import 'package:taskit/components/calendar/event_views/month_view.dart';
import 'package:taskit/components/calendar/event_views/week_view.dart';
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

          EventMaker.eventController
              .addAll(EventMaker.buildEventList(savedEvents));
          return CalendarControllerProvider(
              controller: EventMaker.eventController,
              child: SizedBox(
                height: height * 0.5,
                child: () {
                  if (viewSelector == 1) {
                    return DayViewWidget(width: width, savedEvents: savedEvents,);
                  } else if (viewSelector == 2) {
                    return SizedBox(
                      child: WeekViewWidget(width: width,savedEvents: savedEvents,)
                    );
                  } else if (viewSelector == 0) {
                    return MonthViewWidget(width: width, savedEvents: savedEvents);
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
