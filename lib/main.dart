import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskit/pages/home.dart';
import 'models/eventmodel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
DateTime get _now => DateTime.now();
Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(EventModelAdapter());
  runApp( const ProviderScope(child: HomePage()));
}

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    eventController.addAll(events);
    return CalendarControllerProvider(
      controller: eventController,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskCalendar(),
      ),
    );
  }
}
final EventController eventController = EventController();
List<CalendarEventData> events = [
  CalendarEventData(
    date: DateTime.now(),
    startTime:   DateTime.now(),
    endTime:
    DateTime.now().add(const Duration(minutes: 15)),
    endDate:   DateTime.now(),
    event: "Event 1",
    title: 'aaa',
  ),
  CalendarEventData(
    date: DateTime.now(),
    startTime:   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 13, 37),
    endTime:
    DateTime.now().add(const Duration(minutes: 15)),
    endDate:   DateTime.now(),
    event: "Event 1",
    title: 'bbb',
  ),
  CalendarEventData(
    date: DateTime.now(),
    startTime:   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 37),
    endTime:
    DateTime.now().add(const Duration(minutes: 15)),
    endDate:   DateTime.now(),
    event: "Event 1",
    title: 'ccc',
  ),
];
