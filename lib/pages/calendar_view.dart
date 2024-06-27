import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:taskit/components/timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskit/constants/appconstants.dart';

class TaskCalendar extends StatelessWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: AppThemeColors.background.withOpacity(0.99),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: AppThemeColors.shadow.withOpacity(0.3),
                            spreadRadius: 10,
                            blurRadius: 15,
                            offset: const Offset(0, 1))
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                      decoration: BoxDecoration(
                        color: AppThemeColors.background,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.read_more_outlined,
                                color: AppThemeColors.primaryColor,
                              ),
                              Icon(
                                Icons.person_rounded,
                                color: AppThemeColors.primaryColor,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Hello John,",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            "Today",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppThemeColors.primaryColor,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CalendarTimeLine(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily Tasks",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600)),
                        ),
                       const SizedBox(
                         height: 400,
                         child:  WeekView(showWeekends: false,showVerticalLines: false,headerStyle: HeaderStyle(),),
                       )
                      ],
                    )
                  ),
                ],
              )

          ),
        ));
  }
}
