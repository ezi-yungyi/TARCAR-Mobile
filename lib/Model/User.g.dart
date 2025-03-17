// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      name: fields[1] as String,
      student_id: fields[2] as String,
      email: fields[3] as String,
      phone_number: fields[4] as String,
      token: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.student_id)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone_number)
      ..writeByte(5)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehiclePassAdapter extends TypeAdapter<VehiclePass> {
  @override
  final int typeId = 1;

  @override
  VehiclePass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehiclePass(
      id: fields[0] as int,
      verified_at: fields[1] as int,
      duration: fields[2] as double,
      status: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehiclePass obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.verified_at)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiclePassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 2;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle(
      id: fields[0] as int,
      license_plate: fields[1] as String,
      color: fields[2] as String,
      type: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.license_plate)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TokenHistoryAdapter extends TypeAdapter<TokenHistory> {
  @override
  final int typeId = 3;

  @override
  TokenHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenHistory(
      id: fields[0] as int,
      receive_method: fields[1] as String,
      created_at: fields[3] as String,
      quantity: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TokenHistory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.receive_method)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.created_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
