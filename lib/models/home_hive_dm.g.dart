// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_dm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveDmAdapter extends TypeAdapter<HomeHiveDm> {
  @override
  final int typeId = 1;

  @override
  HomeHiveDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveDm(
      name: fields[1] as String,
      fullName: fields[2] as String,
      avatar: fields[3] as String,
      htmlUrl: fields[4] as String,
      description: fields[5] as String,
      gitUrl: fields[6] as String,
      createdAt: fields[8] as String,
      updatedAt: fields[9] as String,
      size: fields[10] as String,
      stargazersCount: fields[11] as String,
      ownerName: fields[12] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeHiveDm obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.htmlUrl)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.gitUrl)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.size)
      ..writeByte(11)
      ..write(obj.stargazersCount)
      ..writeByte(12)
      ..write(obj.ownerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
