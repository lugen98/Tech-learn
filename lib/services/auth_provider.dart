import 'dart:convert';

import 'package:http/http.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class AuthProvider {
  bool isLoading = false;

  AuthProvider.initWith();

  AuthProvider();

  void reset() {
    isLoading = false;
  }

  Future<UserModel> login(String userName, String password) async {
    var url = AppUrls.loginUrl();
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({"email": userName, "password": password});
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
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

  Future<UserModel> register(
      String firstName,
      String lastName,
      String userName,
      String password,
      String major,
      String degree,
      String phonenumber,
      int usertype) async {
    var url = AppUrls.registerUrl();
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({
      "firstname": firstName,
      "lastname": lastName,
      "email": userName,
      "password": password,
      "usertype": usertype,
      "major": major,
      "degree": degree,
      "phonenumber": phonenumber
    });
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
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

  Future<UserModel> editUser(
      int userId,
      String firstName,
      String lastName,
      String userName,
      String password,
      String major,
      String degree,
      String phonenumber,
      int usertype) async {
    var url = AppUrls.editUser();
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({
      "id": userId,
      "firstname": firstName,
      "lastname": lastName,
      "email": userName,
      "password": password,
      "usertype": usertype,
      "major": major,
      "degree": degree,
      "phonenumber": phonenumber
    });
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
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
