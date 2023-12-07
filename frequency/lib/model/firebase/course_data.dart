import 'package:cloud_firestore/cloud_firestore.dart';

class CourseDataModel {
  String code;
  String description;
  String? id;

  CourseDataModel({
    this.id,
    required this.code,
    required this.description,
  });

  factory CourseDataModel.fromJson(Map<String, dynamic> json) {
    return CourseDataModel(
      id: json['id'],
      code: json['code'],
      description: json['description'],
    );
  }
}
