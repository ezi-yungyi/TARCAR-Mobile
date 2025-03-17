import 'package:hive/hive.dart';

part 'Preference.g.dart';

@HiveType(typeId: 4)
class Timetable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String every;

  @HiveField(3)
  final int from_time;

  @HiveField(4)
  final int to_time;

  Timetable({required this.id, required this.title, required this.every, required this.from_time, required this.to_time});
}