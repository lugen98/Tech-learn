// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.id,
    this.ownerid,
    this.ownername,
    this.coursetype,
    this.coursename,
    this.coursegrade,
    this.gradeid,
    this.coursesubject,
    this.subjectid,
    this.courseprice,
    this.coursedetails,
  });

  int id;
  int ownerid;
  String ownername;
  int coursetype;
  String coursename;
  String coursegrade;
  int gradeid;
  String coursesubject;
  int subjectid;
  String courseprice;
  String coursedetails;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["id"] == null ? null : json["id"],
    ownerid: json["ownerid"] == null ? null : json["ownerid"],
    ownername: json["ownername"] == null ? null : json["ownername"],
    coursetype: json["coursetype"] == null ? null : json["coursetype"],
    coursename: json["coursename"] == null ? null : json["coursename"],
    coursegrade: json["coursegrade"] == null ? null : json["coursegrade"],
    gradeid: json["gradeid"] == null ? null : json["gradeid"],
    coursesubject: json["coursesubject"] == null ? null : json["coursesubject"],
    subjectid: json["subjectid"] == null ? null : json["subjectid"],
    courseprice: json["courseprice"] == null ? null : json["courseprice"],
    coursedetails: json["coursedetails"] == null ? null : json["coursedetails"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "ownerid": ownerid == null ? null : ownerid,
    "ownername": ownername == null ? null : ownername,
    "coursetype": coursetype == null ? null : coursetype,
    "coursename": coursename == null ? null : coursename,
    "coursegrade": coursegrade == null ? null : coursegrade,
    "gradeid": gradeid == null ? null : gradeid,
    "coursesubject": coursesubject == null ? null : coursesubject,
    "subjectid": subjectid == null ? null : subjectid,
    "courseprice": courseprice == null ? null : courseprice,
    "coursedetails": coursedetails == null ? null : coursedetails,
  };
}
