import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalPage extends StatelessWidget {
 final int viewSelector;
 final double height;
 final double width;
   CalPage({super.key, required this.viewSelector, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: SizedBox(
        height: height*0.5,
        child: () {
            if (viewSelector == 1) {
              return DayView(
                controller: EventController(),
                eventTileBuilder: (date, events, boundry, start, end) {
                  // Return your widget to display as event tile.
                  return Container();
                },
                fullDayEventBuilder: (events, date) {
                  // Return your widget to display full day event view.
                  return Container();
                },
                showVerticalLine: true, // To display live time line in day view.
                showLiveTimeLineInAllDays: true, // To display live time line in all pages in day view.
                minDay: DateTime(1990),
                maxDay: DateTime(2050),
                initialDay: DateTime(2021),
                heightPerMinute: 1, // height occupied by 1 minute time span.
                eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
                onEventTap: (events, date) => print(events),
                onEventDoubleTap: (events, date) => print(events),
                onEventLongTap: (events, date) => print(events),
                onDateLongPress: (date) => print(date),
                startHour: 5 ,// To set the first hour displayed (ex: 05:00)
                endHour:20, // To set the end hour displayed
                // hourLinePainter: (lineColor, lineHeight, offset, minuteHeight, showVerticalLine, verticalLineOffset) {
                //   return //Your custom painter.
                // },
                dayTitleBuilder: DayHeader.hidden, // To Hide day header
                keepScrollOffset: true, // To maintain scroll offset when the page changes
              );
            } else  if (viewSelector == 2){
              return WeekView(
                controller: EventController(),
                eventTileBuilder: (date, events, boundry, start, end) {
                  // Return your widget to display as event tile.
                  return Container();
                },
                fullDayEventBuilder: (events, date) {
                  // Return your widget to display full day event view.
                  return Container();
                },
                showLiveTimeLineInAllDays: true, // To display live time line in all pages in week view.
                width: width-40, // width of week view.
                minDay: DateTime(1990),
                maxDay: DateTime(2050),
                initialDay: DateTime(2021),
                heightPerMinute: 1, // height occupied by 1 minute time span.
                eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
                onEventTap: (events, date) => print(events),
                onEventDoubleTap: (events, date) => print(events),
                onDateLongPress: (date) => print(date),
                startDay: WeekDays.sunday, // To change the first day of the week.
                startHour: 5, // To set the first hour displayed (ex: 05:00)
                endHour:20, // To set the end hour displayed
                showVerticalLines: false, // Show the vertical line between days.
                // hourLinePainter: (lineColor, lineHeight, offset, minuteHeight, showVerticalLine, verticalLineOffset) {
                //   return //Your custom painter.
                // },
                weekPageHeaderBuilder: WeekHeader.hidden, // To hide week header
                fullDayHeaderTitle: 'All day', // To set full day events header title
                fullDayHeaderTextConfig: FullDayHeaderTextConfig(
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ), // To set full day events header text config
                keepScrollOffset: true, // To maintain scroll offset when the page changes
              );
            }
            else  if (viewSelector == 0){
              return MonthView(
                controller: EventController(),
                // to provide custom UI for month cells.
                // cellBuilder: (date, events, isToday, isInMonth) {
                //   // Return your widget to display as month cell.
                //   return Container();
                // },
                minMonth: DateTime(1990),
                maxMonth: DateTime(2050),
                initialMonth: DateTime(2021),
                cellAspectRatio: 1,
                onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
                onCellTap: (events, date) {
                  // Implement callback when user taps on a cell.
                  print(events);
                },
                startDay: WeekDays.sunday, // To change the first day of the week.
                // This callback will only work if cellBuilder is null.
                onEventTap: (event, date) => print(event),
                onEventDoubleTap: (events, date) => print(events),
                onEventLongTap: (event, date) => print(event),
                onDateLongPress: (date) => print(date),
                headerBuilder: MonthHeader.hidden, // To hide month header
                showWeekTileBorder: false, // To show or hide header border
                hideDaysNotInMonth: true, // To hide days or cell that are not in current month
              );
            }
          }(),

      )
    );
  }
}

