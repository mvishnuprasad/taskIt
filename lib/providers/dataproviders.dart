import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/models/eventmodel.dart';

 var eventProvider = StateProvider<List<EventModel>>((ref) => []);
var dateProvider = StateProvider<DateTime>((ref) => DateTime.now());
ValueNotifier<bool> myBool = ValueNotifier<bool>(false);

var calendarView = StateProvider<int>((ref) => 1);

//var eventProvider = StateProvider<List<CalendarEventData>>((ref) => []);