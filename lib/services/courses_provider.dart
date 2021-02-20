import 'package:http/http.dart';
import 'package:techlearning_app/entities/courseListModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class CoursesProvider {
  bool isLoading = false;

  CoursesProvider.initWith();

  CoursesProvider();

  void reset() {
    isLoading = false;
  }

  Future<List<CourseListModel>> getAllCourses() async {
    var url = AppUrls.loginUrl();
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await post(url, headers: headers);
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
}
