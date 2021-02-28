import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/UI/teacher_dashboard.dart';
import 'package:techlearning_app/_common_widgets/or_divider.dart';
import 'package:techlearning_app/entities/registerModel.dart';
import 'package:techlearning_app/services/auth_provider.dart';
import 'package:techlearning_app/sign_up_sign_in/teacher/teacher_sign_in.dart';

class TeacherSignUp extends StatefulWidget {
  @override
  _TeacherSignUpState createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  AuthProvider _registerProvider = AuthProvider();
  final _formKey = GlobalKey<FormState>();
  bool isHidePassword = false;
  bool isShowPassword = false;

  //text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPass = '';
  String degree = '';
  String major = '';
  String phoneNumber = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tech',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w600,
                          fontSize: 20))),
              Text('Learn',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFFFFD900),
                          fontWeight: FontWeight.w600,
                          fontSize: 20))),
              Padding(padding: EdgeInsets.only(right: 30, left: 30)),
            ],
          ),
          leading: Container(
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF053361),
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  Text('Sign up For TechLearn',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF053361),
                              fontWeight: FontWeight.w700,
                              fontSize: 18))),
                ],
              ),
            ),
            Container(
                child: Column(children: <Widget>[
              SizedBox(height: size.height * 0.04),
              SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF6D747A)),
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightColor: Color(0xFF6D747A),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () async {
                   // await _auth.signInGoogle();
                  },
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        'images/search 1.svg',
                        height: 20.0,
                        width: 20.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 40, left: 50.0),
                          child: Text(
                            "Sign up with google",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500)),
                          ))
                    ],
                  ),
                ),
              )
            ])),
            OrDivider(),
            Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: size.height * 0.01),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter First Name' : null,
                              decoration: InputDecoration(
                                  labelText: 'First name',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => firstName = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Last Name' : null,
                              decoration: InputDecoration(
                                  labelText: 'last name',
                                  prefixIcon: Icon(Icons.people),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => lastName = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(

                              validator: (val) =>
                                  val.isEmpty ? 'Enter email' : null,
                              decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(

                                validator: (val) => val.length < 6
                                    ? 'password Should be more than 6'
                                    : null,
                                obscureText: !isHidePassword,
                                decoration: InputDecoration(
                                    hintText: "password 6+ characters",
                                    labelText: "password",
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(isHidePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      color: isHidePassword
                                          ? Color(0xFF0A61B7)
                                          : Colors.grey,
                                      onPressed: () {
                                        _togglePasswordVisability();
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC8CACC),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onChanged: (val) {
                                  setState(() => password = val);
                                }),
                          ),

                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter your Degree' : null,
                              decoration: InputDecoration(
                                  hintText: 'Degree',
                                  labelText: 'Degree',
                                  prefixIcon: Image.asset(
                                    'images/Degree Icon.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => degree = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter your Major' : null,
                              decoration: InputDecoration(
                                  hintText: 'Major',
                                  labelText: 'Major',
                                  prefixIcon: Icon(Icons.bookmark),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => major = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC8CACC),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              onChanged: (val) {
                                setState(() => phoneNumber = val);
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                Text('By signing up, you agree to our',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Color(0xFF6D747A),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12))),
                                InkWell(
                                  onTap: () {},
                                  child: Text('Terms and ',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12))),
                                )
                              ])),
                          Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Text('Privacy Policy',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12))),
                                )
                              ])),
                          SizedBox(
                            height: 12.0,
                            child: Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ),
                          Container(
                            child: Column(children: <Widget>[
                              SizedBox(height: size.height * 0.03),
                              SizedBox(
                                width: 328,
                                height: 49,
                                child: RaisedButton(
                                    color: Color(0xFFFFD900),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF053361),
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _registerProvider.isLoading = true;
                                      });
                                      if (_formKey.currentState.validate()) {
                                        UserModel result =
                                            await _registerProvider.register(
                                                firstName,
                                                lastName,
                                                email,
                                                password,
                                                degree,
                                                major,
                                                phoneNumber,
                                                0);
                                        if (result == null) {
                                          setState(() =>
                                              error = 'Failed To Sign In');
                                        } else {
                                          saveUserInSharedPreferences(result);
                                          print(result.firstname);
                                          print(result.lastname);
                                          print(result.email);
                                          print(result.degree);
                                          print(result.major);
                                          print(result.phone);
                                          print(result.usertype);

                                        }
                                      }
                                    }),
                              ),
                            ]),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: size.height * 0.02),
                                Text(
                                  'Already have an account?',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF053361),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700)),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeacherSignIn()));
                                    },
                                    child: Text(
                                      "Click here to Sign In ",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w700)),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                        ]))))
          ])),
        ));
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
  saveUserInSharedPreferences(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userModel);
    pref.setString('userData', user);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TeacherDashboard()));
  }

}
