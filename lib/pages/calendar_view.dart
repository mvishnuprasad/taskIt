import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/components/event_dayview.dart';
import 'package:taskit/components/date_timeline.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:taskit/providers/dataproviders.dart';
import '../components/textviews/date_text.dart';
import '../components/textviews/text_view.dart';

class TaskCalendar extends ConsumerWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventData = ref.watch(eventProvider);
    final height = MediaQuery.sizeOf(context).height;
    return CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              resizeToAvoidBottomInset: false,
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 80),
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
                          TextView(
                            title: "Hello John,",
                            fontSize: 14,
                            color: AppThemeColors.shadow,
                            fontWeight: FontWeight.bold,
                          ),
                          TextView(
                            title: "Today",
                            fontSize: 36,
                            color: AppThemeColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CalendarTimeLine(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                title: "Daily Tasks",
                                fontSize: 28,
                                color: AppThemeColors.shadow,
                                fontWeight: FontWeight.w600,
                              ),
                              const TodayDate(),
                            ],
                          ),
                          const SizedBox(height: 400, child: EventDayView())
                        ],
                      )),
                ],
              )),
        ));
  }
}
