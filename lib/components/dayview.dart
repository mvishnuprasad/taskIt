import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/components/dateview.dart';
import 'package:taskit/pages/event_detail.dart';
import '../constants/appconstants.dart';

class EventDayView extends StatelessWidget {
  const EventDayView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return SizedBox(
      height: 400,
      child: DayView(
        date: date,
        userZoomable: false,
        hoursColumnStyle: HoursColumnStyle(
          textAlignment: Alignment.centerLeft,
          color: AppThemeColors.background,
          textStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: AppThemeColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ),
        dayBarStyle: DayBarStyle(
            textStyle: TextStyle(
              color: AppThemeColors.background,
            ),
            color: AppThemeColors.background,
            textAlignment: Alignment.centerLeft),
        style: DayViewStyle(
          hourRowHeight: 60,
          headerSize:20,
          currentTimeCircleRadius: 10,

          currentTimeCircleColor: AppThemeColors.highLight,
          currentTimeRuleHeight: 2,
          currentTimeRuleColor: AppThemeColors.primaryColor,
          backgroundColor: AppThemeColors.background,
        ),
        events: [
          FlutterWeekViewEvent(
            textStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppThemeColors.background,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: AppThemeColors.highLight),
            title: 'An event 1',
            description: 'Even details are here',
            start: date.subtract(const Duration(hours: 1)),
            end: date.add(const Duration(hours: 2, minutes: 10)),
            onTap:   (){
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => EventDetail()// The page to display as a bottom sheet
              );
            }
          ),
        ],
      ),
    );
  }
}
