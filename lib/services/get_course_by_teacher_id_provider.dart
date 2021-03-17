import 'package:http/http.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/courseListModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class GetCoursesByTeacherIdProvider {
  bool isLoading = false;

  GetCoursesByTeacherIdProvider.initWith();

  GetCoursesByTeacherIdProvider();

  void reset() {
    isLoading = false;
  }

  Future<List<CourseModel>> getAllCoursesByTeacherId(int TeacherId) async {
    var url = AppUrls.getAllCoursesByTeacherId(TeacherId);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final getCourseListbyTeacherId =
          courseListModelFromJson(apiResponse.body);
      isLoading = false;
      return getCourseListbyTeacherId;
    } catch (e) {
      isLoading = false;
    }
  }
}
