import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:taskit/models/eventmodel.dart';

class HiveMethods {
  void saveToHive(EventModel eventModel) async {
    final eventBox = await Hive.openBox<EventModel>('eventBox');

      await eventBox.put(eventModel.title, eventModel);
      debugPrint('SAVED ${eventModel.title}');
      debugPrint('SAVED ${eventModel.title}');

  }

  void delete(EventModel newsModel) async {
    final newsBox = await Hive.openBox<EventModel>('newsBox');
    await newsBox.delete(newsModel.title);
    debugPrint('DELETED ${newsModel.title}');
  }
}
