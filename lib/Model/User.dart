import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String student_id;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone_number;

  @HiveField(5)
  final int token;

  User({required this.id, required this.name, required this.student_id, required this.email, required this.phone_number, required this.token});
}

@HiveType(typeId: 1)
class VehiclePass {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int verified_at;

  @HiveField(2)
  final double duration;

  @HiveField(3)
  final String status;

  VehiclePass({required this.id, required this.verified_at, required this.duration, required this.status});
}

@HiveType(typeId: 2)
class Vehicle {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String license_plate;

  @HiveField(2)
  final String color;

  @HiveField(3)
  final String type;

  Vehicle({required this.id, required this.license_plate, required this.color, required this.type});
}

@HiveType(typeId: 3)
class TokenHistory {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String receive_method;

  @HiveField(2)
  final int quantity;

  @HiveField(3)
  final String created_at;

  TokenHistory({required this.id, required this.receive_method, required this.created_at, required this.quantity});
}