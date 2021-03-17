import 'dart:convert';

import 'package:http/http.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/SubjectsModel.dart';
import 'package:techlearning_app/entities/courseListModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class CoursesProvider {
  bool isLoading = false;

  CoursesProvider.initWith();

  CoursesProvider();

  void reset() {
    isLoading = false;
  }

  Future<List<CourseModel>> getAllCourses() async {
    var url = AppUrls.getAllCoursesUrl();
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final courseList = courseListModelFromJson(apiResponse.body);
      isLoading = false;
      return courseList;
    } catch (e) {
      isLoading = false;
    }
  }

  Future<List<CourseModel>> getCustomCourses() async {
    var url = AppUrls.getCustomCourses();
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final courseList = courseListModelFromJson(apiResponse.body);
      isLoading = false;
      return courseList;
    } catch (e) {
      isLoading = false;
    }
  }

  Future<List<SubjectsModel>> getSubjectsByGradeId(int id) async {
    var url = AppUrls.getSubjectsByGradeId(id);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final subjectsModel = subjectsModelFromJson(apiResponse.body);
      isLoading = false;
      return subjectsModel;
    } catch (e) {
      isLoading = false;
    }
  }

  Future<List<CourseModel>> getCoursesByGradeAndSubject(
      int grade, int subject) async {
    var url = AppUrls.getCourseByGradeSubject(grade, subject);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final courseList = courseListModelFromJson(apiResponse.body);
      isLoading = false;
      return courseList;
    } catch (e) {
      isLoading = false;
    }
  }

  Future<String> addCourse(CourseModel courseModel) async {
    var url = AppUrls.addCourse();
    Map<String, String> headers = {"Content-type": "application/json"};

    isLoading = true;
    var body = jsonEncode(courseModel);
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      isLoading = false;
      return apiResponse.body;
    } catch (e) {
      isLoading = false;
    }
  }
}
