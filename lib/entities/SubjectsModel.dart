// To parse this JSON data, do
//
//     final subjectsModel = subjectsModelFromJson(jsonString);

import 'dart:convert';

List<SubjectsModel> subjectsModelFromJson(String str) =>
    List<SubjectsModel>.from(
        json.decode(str).map((x) => SubjectsModel.fromJson(x)));

String subjectsModelToJson(List<SubjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectsModel {
  SubjectsModel({
    this.id,
    this.gradeid,
    this.subjectname,
    this.subjectnamear,
  });

  int id;
  int gradeid;
  String subjectname;
  dynamic subjectnamear;

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        id: json["id"] == null ? null : json["id"],
        gradeid: json["gradeid"] == null ? null : json["gradeid"],
        subjectname: json["subjectname"] == null ? null : json["subjectname"],
        subjectnamear: json["subjectnamear"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "gradeid": gradeid == null ? null : gradeid,
        "subjectname": subjectname == null ? null : subjectname,
        "subjectnamear": subjectnamear,
      };
}
