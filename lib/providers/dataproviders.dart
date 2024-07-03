import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/models/eventmodel.dart';

var eventProvider = StateProvider<List<EventModel>>((ref) => []);
