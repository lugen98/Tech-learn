import 'dart:convert';
import 'package:http/http.dart';
import 'package:techlearning_app/entities/EditCourseModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class EditCourseProvider {
  bool isLoading = false;

  EditCourseProvider.initWith();

  EditCourseProvider();

  void reset() {
    isLoading = false;
  }

  // ignore: missing_return
  Future<EditCourseModel> putEditCourse() async {
    var url = AppUrls.editCourseUrl();
    Map<String, String> headers = {"Content-type": "application/json"};

    isLoading = true;


    Response apiResponse = await put(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final editCourse = editCourseModelFromJson(apiResponse.body);
      isLoading = false;
      return editCourse;
    } catch (e) {
      isLoading = false;
    }
  }
}
