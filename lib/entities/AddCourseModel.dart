// To parse this JSON data, do
//
//     final addCourseModel = addCourseModelFromJson(jsonString);

import 'dart:convert';

AddCourseModel addCourseModelFromJson(String str) => AddCourseModel.fromJson(json.decode(str));

String addCourseModelToJson(AddCourseModel data) => json.encode(data.toJson());

class AddCourseModel {
  AddCourseModel({
    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  String timestamp;
  int status;
  String error;
  String message;
  String path;

  factory AddCourseModel.fromJson(Map<String, dynamic> json) => AddCourseModel(
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    message: json["message"] == null ? null : json["message"],
    path: json["path"] == null ? null : json["path"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp == null ? null : timestamp,
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "message": message == null ? null : message,
    "path": path == null ? null : path,
  };
}
