// To parse this JSON data, do
//
//     final courseListModel = courseListModelFromJson(jsonString);

import 'dart:convert';

List<CourseListModel> courseListModelFromJson(String str) =>
    List<CourseListModel>.from(
        json.decode(str).map((x) => CourseListModel.fromJson(x)));

String courseListModelToJson(List<CourseListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseListModel {
  CourseListModel({
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

  factory CourseListModel.fromJson(Map<String, dynamic> json) =>
      CourseListModel(
        id: json["id"] == null ? null : json["id"],
        ownerid: json["ownerid"] == null ? null : json["ownerid"],
        coursetype: json["coursetype"] == null ? null : json["coursetype"],
        coursename: json["coursename"] == null ? null : json["coursename"],
        coursegrade: json["coursegrade"] == null ? null : json["coursegrade"],
        coursesubject:
            json["coursesubject"] == null ? null : json["coursesubject"],
        courseprice: json["courseprice"] == null ? null : json["courseprice"],
        coursedetails:
            json["coursedetails"] == null ? null : json["coursedetails"],
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
