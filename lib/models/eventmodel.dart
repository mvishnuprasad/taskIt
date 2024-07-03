import 'package:hive/hive.dart';

part 'eventmodel.g.dart';



@HiveType(typeId: 0,adapterName: "EventModelAdapter")
class EventModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  String location;

  @HiveField(4)
  List<String>? members;



  EventModel({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    this.members,
  });
}
