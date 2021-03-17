import 'package:http/http.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class UsersProvider {
  bool isLoading = false;

  UsersProvider.initWith();

  UsersProvider();

  void reset() {
    isLoading = false;
  }

  Future<UserModel> getTeacherByTeacherId(int id) async {
    var url = AppUrls.getTeacherById(id);
    Map<String, String> headers = {"Content-type": "application/json"};
    isLoading = true;

    Response apiResponse = await get(url, headers: headers);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final userModel = userModelFromJson(apiResponse.body);
      isLoading = false;
      return userModel;
    } catch (e) {
      isLoading = false;
    }
  }
}
