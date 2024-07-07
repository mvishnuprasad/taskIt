// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_week_view/flutter_week_view.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:taskit/models/eventmodel.dart';
// import 'package:taskit/pages/add_event.dart';
// import 'package:taskit/pages/event_detail.dart';
// import '../../constants/appconstants.dart';
//
// class EventDayView extends ConsumerWidget {
//   final double height;
//   const EventDayView(this.height, {super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //  final eventData = ref.watch(eventProvider);
//     DateTime now = DateTime.now();
//     DateTime date = DateTime(now.year, now.month, now.day);
//     List<int> getTimeFromString(String timeString) {
//       DateFormat format = DateFormat('h:mm');
//       DateTime dateTime = format.parse(timeString);
//       int hours = dateTime.hour;
//       int minutes = dateTime.minute;
//       return [hours, minutes];
//     }
//
//     List<FlutterWeekViewEvent> buildEventList(List<EventModel> event) {
//       List<FlutterWeekViewEvent> events = [];
//       for (var event in event) {
//         events.add(FlutterWeekViewEvent(
//           textStyle: GoogleFonts.poppins(
//             textStyle: TextStyle(
//               color: AppThemeColors.background,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             color: AppThemeColors.highLight,
//           ),
//           title: event.title,
//           description: event.location,
//           start: date.add(Duration(
//               hours: getTimeFromString(event.startTime).first,
//               minutes: getTimeFromString(event.startTime).last)),
//           end: date.add(Duration(
//               hours: getTimeFromString(event.endTime).first,
//               minutes: getTimeFromString(event.endTime).first)),
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               isScrollControlled: true,
//               builder: (context) => EventDetail(
//                 eventTitle: event.title,
//                 eventTime: "${event.startTime} - ${event.endTime}",
//                 eventLocation: event.location,
//               ),
//             );
//           },
//         ));
//       }
//
//       return events;
//     }
//
//     return FutureBuilder<Box<EventModel>>(
//       future: Hive.openBox<EventModel>('eventBox'),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           var eventsBox = snapshot.data!;
//           var savedEvents = eventsBox.values.toList();
//           return SizedBox(
//             height : height*0.5,
//             child: DayView(
//                 onHoursColumnTappedDown: (HourMinute hour) {
//                   debugPrint("$hour");
//                   debugPrint("${savedEvents.length}");
//                 },
//                 onBackgroundTappedDown: (DateTime time) {
//                   debugPrint("${savedEvents.length}");
//                   showModalBottomSheet(
//                       isScrollControlled: true,
//                       context: context,
//                       builder: (context) => const AddEvent(
//                             eventTitle: "Add New Event",
//                           ));
//                 },
//                 date: date,
//                 userZoomable: false,
//                 hoursColumnStyle: HoursColumnStyle(
//                   timeFormatter: (HourMinute hourMinute) {
//                     DateTime now = DateTime.now();
//                     DateTime datetime = DateTime(now.year, now.month, now.day,
//                         hourMinute.hour, hourMinute.minute);
//                     String formattedTime = DateFormat('hh:mm a').format(datetime);
//                     return formattedTime;
//                   },
//                   textAlignment: Alignment.centerLeft,
//                   color: AppThemeColors.background,
//                   textStyle: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                           color: AppThemeColors.primaryColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 dayBarStyle: DayBarStyle(
//                     textStyle: TextStyle(
//                       color: AppThemeColors.background,
//                     ),
//                     color: AppThemeColors.background,
//                     textAlignment: Alignment.centerLeft),
//                 style: DayViewStyle(
//                   hourRowHeight: 60,
//                   headerSize: 20,
//                   currentTimeCircleRadius: 10,
//                   currentTimeCircleColor: AppThemeColors.primaryColor,
//                   currentTimeRuleHeight: 3,
//                   currentTimeRuleColor: AppThemeColors.primaryColor,
//                   backgroundColor: AppThemeColors.background,
//                 ),
//                 events: buildEventList(savedEvents)),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
