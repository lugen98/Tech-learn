import 'dart:convert';

import 'package:http/http.dart';
import 'package:techlearning_app/entities/loginModel.dart';
import 'package:techlearning_app/entities/registerModel.dart';
import 'package:techlearning_app/shared/app_urls.dart';

class AuthProvider {
  bool isLoading = false;

  AuthProvider.initWith();

  AuthProvider();

  void reset() {
    isLoading = false;
  }

  Future<LoginModel> login(String userName, String password) async {
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
      final loginModel = loginModelFromJson(apiResponse.body);
      isLoading = false;
      return loginModel;
    } catch (e) {
      isLoading = false;
    }
  }


  Future<RegisterModel> register(String firstName,String lastName,String userName, String password,String major,String degree,String phonenumber,int usertype) async {
    var url = AppUrls.registerUrl();
    Map<String, String> headers = {"Content-type": "application/json"};
    var body = jsonEncode({"firstname" :firstName,"lastname":lastName,"email": userName, "password": password,"usertype":usertype,"major":major,"degree":degree,"phonenumber":phonenumber});
    isLoading = true;

    print("SendApi Body: " + body.toString());
    Response apiResponse = await post(url, headers: headers, body: body);
    print("SendApi Response status: ${apiResponse.statusCode}");
    print("SendApi ${apiResponse.headers}");
    print("SendApi ${apiResponse.request}");
    print("SendApi" + apiResponse.body);

    try {
      final  registerModel =  registerModelFromJson(apiResponse.body);
      isLoading = false;
      return registerModel;
    } catch (e) {
      isLoading = false;
    }
  }

}
