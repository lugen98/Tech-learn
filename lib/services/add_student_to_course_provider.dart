import 'dart:convert';

import 'package:http/http.dart';
import 'package:techlearning_app/entities/addStudentToCourseModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class AddStudentToCourseProvider {
  bool isLoading = false;

  AddStudentToCourseProvider.initWith();

  AddStudentToCourseProvider();

  void reset() {
    isLoading = false;
  }

  Future<AddStudentToCourse> addStudentToCourse() async {
    var url = AppUrls.addStudentToCourse();
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({});
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final addstudentToCourse = addStudentToCourseFromJson(apiResponse.body);
      isLoading = false;
      return addstudentToCourse;
    } catch (e) {
      isLoading = false;
    }
  }
}
