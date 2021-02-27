// To parse this JSON data, do
//
//     final editCourseModel = editCourseModelFromJson(jsonString);

import 'dart:convert';

EditCourseModel editCourseModelFromJson(String str) => EditCourseModel.fromJson(json.decode(str));

String editCourseModelToJson(EditCourseModel data) => json.encode(data.toJson());

class EditCourseModel {
  EditCourseModel({
    this.id,
    this.ownerid,
    this.coursetype,
    this.coursename,
    this.coursegrade,
    this.coursesubject,
    this.courseprice,
    this.coursedetails,
  });

  int id;
  int ownerid;
  int coursetype;
  String coursename;
  String coursegrade;
  String coursesubject;
  String courseprice;
  String coursedetails;

  factory EditCourseModel.fromJson(Map<String, dynamic> json) => EditCourseModel(
    id: json["id"] == null ? null : json["id"],
    ownerid: json["ownerid"] == null ? null : json["ownerid"],
    coursetype: json["coursetype"] == null ? null : json["coursetype"],
    coursename: json["coursename"] == null ? null : json["coursename"],
    coursegrade: json["coursegrade"] == null ? null : json["coursegrade"],
    coursesubject: json["coursesubject"] == null ? null : json["coursesubject"],
    courseprice: json["courseprice"] == null ? null : json["courseprice"],
    coursedetails: json["coursedetails"] == null ? null : json["coursedetails"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "ownerid": ownerid == null ? null : ownerid,
    "coursetype": coursetype == null ? null : coursetype,
    "coursename": coursename == null ? null : coursename,
    "coursegrade": coursegrade == null ? null : coursegrade,
    "coursesubject": coursesubject == null ? null : coursesubject,
    "courseprice": courseprice == null ? null : courseprice,
    "coursedetails": coursedetails == null ? null : coursedetails,
  };
}
