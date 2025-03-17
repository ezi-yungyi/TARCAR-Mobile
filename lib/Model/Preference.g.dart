// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimetableAdapter extends TypeAdapter<Timetable> {
  @override
  final int typeId = 4;

  @override
  Timetable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timetable(
      id: fields[0] as int,
      title: fields[1] as String,
      every: fields[2] as String,
      from_time: fields[3] as int,
      to_time: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Timetable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.every)
      ..writeByte(3)
      ..write(obj.from_time)
      ..writeByte(4)
      ..write(obj.to_time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
