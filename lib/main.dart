import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskit/components/calendar/event_maker.dart';
import 'package:taskit/pages/home.dart';
import 'package:taskit/pages/launchscreen.dart';
import 'models/eventmodel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(EventModelAdapter());
  runApp(const ProviderScope(child: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // eventController.addAll(eventsList);
    return CalendarControllerProvider(
      controller: EventMaker.eventController,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
