// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Parking.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParkingSpotAdapter extends TypeAdapter<ParkingSpot> {
  @override
  final int typeId = 5;

  @override
  ParkingSpot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParkingSpot(
      id: fields[0] as int,
      index: fields[1] as String,
      occupied: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ParkingSpot obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.occupied);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParkingSpotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParkingAreaAdapter extends TypeAdapter<ParkingArea> {
  @override
  final int typeId = 6;

  @override
  ParkingArea read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParkingArea(
      id: fields[0] as int,
      name: fields[1] as String,
      parking_spots: (fields[2] as List).cast<ParkingSpot>(),
    );
  }

  @override
  void write(BinaryWriter writer, ParkingArea obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.parking_spots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParkingAreaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
