import 'dart:convert';

AddStudentToCourse addStudentToCourseFromJson(String str) => AddStudentToCourse.fromJson(json.decode(str));

String addStudentToCourseToJson(AddStudentToCourse data) => json.encode(data.toJson());

class AddStudentToCourse {
  AddStudentToCourse({
    this.id,
    this.courseid,
    this.userid,
  });

  dynamic id;
  dynamic courseid;
  dynamic userid;

  factory AddStudentToCourse.fromJson(Map<String, dynamic> json) => AddStudentToCourse(
    id: json["id"] == null ? null : json["id"],
    courseid: json["courseid"] == null ? null : json["courseid"],
    userid: json["userid"] == null ? null : json["userid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "courseid": courseid == null ? null : courseid,
    "userid": userid == null ? null : userid,
  };
}
