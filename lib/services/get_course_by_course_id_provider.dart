import 'package:http/http.dart';
import 'package:techlearning_app/entities/getCourseByCourseIdModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class GetCoursebyCourseIdProvider {
  bool isLoading = false;

  GetCoursebyCourseIdProvider.initWith();

  GetCoursebyCourseIdProvider();

  void reset() {
    isLoading = false;
  }

  Future<GetCoursebyCourseId> getAllCoursesByCourseId( int CourseId) async {
    var url = AppUrls.getAllCoursesByCourseId(CourseId);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final getCourseListbyCourseId =getCoursebyCourseIdFromJson(apiResponse.body);
      isLoading = false;
      return getCourseListbyCourseId;
    } catch (e) {
      isLoading = false;
    }
  }
}
