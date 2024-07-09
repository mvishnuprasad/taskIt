import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/components/calendar/event_view.dart';
import 'package:taskit/components/cards/title_view.dart';
import 'package:taskit/constants/appconstants.dart';
import 'package:taskit/providers/dataproviders.dart';
import '../components/calendar/calendar_view.dart';
import '../components/cards/text_view.dart';

class TaskCalendar extends ConsumerWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventData = ref.watch(eventProvider);
    final viewData = ref.watch(calendarView.notifier);
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final topHeight = height * 0.4;
    final bottomHeight = height - topHeight;

    return ValueListenableBuilder<bool>(
        valueListenable: myBool,
        builder: (context, value, child) {
          return CalendarControllerProvider(
            controller: EventController(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: AppThemeColors.background.withOpacity(0.99),
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //height: height * 0.6,

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
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 80),
                            decoration: BoxDecoration(
                              color: AppThemeColors.background,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          title: "Hello John,",
                                          fontSize: 14,
                                          color: AppThemeColors.shadow,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        TitleView(
                                          title: CalendarTitles
                                              .titles[viewData.state],
                                          dateTitle: CalendarTitles
                                              .dateValues[viewData.state],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: SegmentedButton<int>(
                                        showSelectedIcon: false,
                                        style: SegmentedButton.styleFrom(
                                          side: BorderSide(
                                              width: 0,
                                              color: AppThemeColors.highLight
                                                  .withOpacity(0.3)),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                          backgroundColor: AppThemeColors
                                              .highLight
                                              .withOpacity(0.3),
                                          foregroundColor:
                                              AppThemeColors.primaryColor,
                                          selectedForegroundColor: Colors.white,
                                          selectedBackgroundColor:
                                              AppThemeColors.highLight,
                                        ),
                                        segments: const <ButtonSegment<int>>[
                                          ButtonSegment(
                                              value: 1,
                                              icon: Icon(Icons
                                                  .calendar_view_day_rounded)),
                                          ButtonSegment(
                                              value: 2,
                                              icon: Icon(Icons
                                                  .calendar_view_week_rounded)),
                                          ButtonSegment(
                                              value: 0,
                                              icon: Icon(Icons
                                                  .calendar_view_month_rounded)),
                                        ],
                                        selected: <int>{viewData.state},
                                        onSelectionChanged:
                                            (Set<int> newSelection) {
                                          myBool.value = !myBool.value;
                                          viewData.state = newSelection.first;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CalendarView(height),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: bottomHeight,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      title: "Daily Tasks",
                                      fontSize: 28,
                                      color: AppThemeColors.shadow,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),

                                //viewData.state == 2 ?EventDayView(height) : EventWeekView(height,width)
                               Container(
                                 decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                 ),
                                 child:  EventsView(
                                   viewSelector: viewData.state,
                                   height: height,
                                   width: width,
                                 ),
                               )
                              ],
                            )),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
