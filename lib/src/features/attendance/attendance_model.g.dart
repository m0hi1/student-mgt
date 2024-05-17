// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceModelAdapter extends TypeAdapter<AttendanceModel> {
  @override
  final int typeId = 2;

  @override
  AttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceModel(
      course: fields[0] as String,
      date: fields[1] as DateTime,
      presentStudentKeys: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.presentStudentKeys);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
