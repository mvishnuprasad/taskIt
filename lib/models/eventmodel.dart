import 'package:hive/hive.dart';

part 'eventmodel.g.dart';

@HiveType(typeId: 0, adapterName: "EventModelAdapter")
class EventModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String startTime;

  @HiveField(3)
  String endTime;

  @HiveField(4)
  String location;

  @HiveField(5)
  List<String>? members;

  EventModel({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    this.members,
  });
}
