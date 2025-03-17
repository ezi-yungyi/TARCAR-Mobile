import 'package:hive/hive.dart';

part 'Parking.g.dart';

@HiveType(typeId: 5)
class ParkingSpot {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String index;

  @HiveField(2)
  final bool occupied;

  ParkingSpot({required this.id, required this.index, required this.occupied});
}

@HiveType(typeId: 6)
class ParkingArea {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<ParkingSpot> parking_spots;

  ParkingArea({required this.id, required this.name, required this.parking_spots});
}