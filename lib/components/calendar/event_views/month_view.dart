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

class MonthViewWidget extends StatelessWidget {
  final double width;
  final List<EventModel> savedEvents;
  const MonthViewWidget(
      {super.key, required this.width, required this.savedEvents});

  @override
  Widget build(BuildContext context) {
    return MonthView(
      hideDaysNotInMonth: true,
      showBorder: true,
      borderColor: AppThemeColors.highLight.withOpacity(0.6),
      borderSize: BorderSide.strokeAlignCenter,
      cellBuilder:
          (day, List<CalendarEventData<Object?>> value, bool, bool2, bool3) {
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
      startDay: WeekDays.sunday, // To change the first day of the week.
      // This callback will only work if cellBuilder is null.
      onEventTap: (event, date) => print(event),
      onEventDoubleTap: (events, date) => print(events),
      onEventLongTap: (event, date) => print(event),
      onDateLongPress: (date) => print(date),
      headerStyle: HeaderStyle(
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
      headerStringBuilder: (time, {DateTime? secondaryDate}) {
        return DateFormat('MMMM yyyy').format(time);
      },

      headerBuilder: (time, {DateTime? secondaryDate}) {
        return Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
}
