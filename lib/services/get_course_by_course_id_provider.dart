import 'package:http/http.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class GetCoursebyCourseIdProvider {
  bool isLoading = false;

  GetCoursebyCourseIdProvider.initWith();

  GetCoursebyCourseIdProvider();

  void reset() {
    isLoading = false;
  }

  Future<CourseModel> getCourseByCourseId(int CourseId) async {
    var url = AppUrls.getCourseByCourseId(CourseId);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final courseModel = courseModelFromJson(apiResponse.body);
      isLoading = false;
      return courseModel;
    } catch (e) {
      isLoading = false;
    }
  }
}
