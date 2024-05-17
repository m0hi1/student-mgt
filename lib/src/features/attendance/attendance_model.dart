// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 2)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  final String course;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final List<String> presentStudentKeys; // Store keys of present students

  AttendanceModel({
    required this.course,
    required this.date,
    required this.presentStudentKeys,
  });

  AttendanceModel copyWith({
    String? course,
    DateTime? date,
    List<String>? presentStudentKeys,
  }) {
    return AttendanceModel(
      course: course ?? this.course,
      date: date ?? this.date,
      presentStudentKeys: presentStudentKeys ?? this.presentStudentKeys,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'course': course,
      'date': date.millisecondsSinceEpoch,
      'presentStudentKeys': presentStudentKeys,
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      course: map['course'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      presentStudentKeys: List<String>.from(map['presentStudentKeys']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceModel.fromJson(String source) =>
      AttendanceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AttendanceModel(course: $course, date: $date, presentStudentKeys: $presentStudentKeys)';

  @override
  bool operator ==(covariant AttendanceModel other) {
    if (identical(this, other)) return true;

    return other.course == course &&
        other.date == date &&
        listEquals(other.presentStudentKeys, presentStudentKeys);
  }

  @override
  int get hashCode =>
      course.hashCode ^ date.hashCode ^ presentStudentKeys.hashCode;
}
