// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.major,
    this.degree,
    this.phone,
    this.usertype,
  });

  dynamic id;
  String email;
  String firstname;
  String lastname;
  String password;
  String major;
  String degree;
  String phone;
  String usertype;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        password: json["password"] == null ? null : json["password"],
        major: json["major"] == null ? null : json["major"],
        degree: json["degree"] == null ? null : json["degree"],
        phone: json["phone"] == null ? null : json["phone"],
        usertype: json["usertype"] == null ? null : json["usertype"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "password": password == null ? null : password,
        "major": major == null ? null : major,
        "degree": degree == null ? null : degree,
        "phone": phone == null ? null : phone,
        "usertype": usertype == null ? null : usertype,
      };
}
