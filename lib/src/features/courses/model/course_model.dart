// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'course_model.g.dart';

@HiveType(typeId: 1)
class CourseModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  CourseModel({
    required this.title,
    required this.description,
  });

  CourseModel copyWith({
    String? title,
    String? description,
  }) {
    return CourseModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CourseModel(title: $title, description: $description)';

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
