import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/teacher_dashboard.dart';
import 'package:techlearning_app/_common_widgets/or_divider.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/shared/my_constants.dart';
import 'package:techlearning_app/shared/shared_preferences_management.dart';
import 'package:techlearning_app/sign_up_sign_in/teacher/teacher_forgot_password.dart';

import 'teacher_sign_up.dart';

class TeacherSignIn extends StatefulWidget {
  @override
  _TeacherSignInState createState() => _TeacherSignInState();
}

class _TeacherSignInState extends State<TeacherSignIn> {
  SharedPreferencesManagement _sharedPreferencesManagement;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isHidePassword = false;

  bool checkBokValue = false;

  //text filed state
  String email = '';
  String _password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,

        //techLearn appbar
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

          //arrowBack
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
                  Text('Sign in to your TechLearn Account',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF053361),
                              fontWeight: FontWeight.bold,
                              fontSize: 18))),
                ],
              ),
            ),

            //signIn with Google
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
                    await _auth.signInGoogle();
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
                            "Sign in with google",
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
            SizedBox(height: size.height * 0.03),

            OrDivider(),

            //sign In Email&Password
            Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: size.height * 0.01),
                          SizedBox(
                            height: 49,
                            width: 328,
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
                                    ? 'password Should be more than6'
                                    : null,
                                obscureText: !isHidePassword,
                                decoration: InputDecoration(
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
                                    labelText: "password",
                                    prefixIcon: Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC8CACC),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onChanged: (val) {
                                  setState(() => _password = val);
                                }),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: checkBokValue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkBokValue = value;
                                      });
                                    }),
                                InkWell(
                                  onTap: () {},
                                  child: Text('Remember Me?',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeacherForgotPass()));
                                  },
                                  child: Text('Forgot Password?',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                              ],
                            ),
                          ),

                          //sign In Button
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
                                    "Sign in",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF053361),
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      dynamic result = await _auth
                                          .signInTeacherEP(email, _password);
                                      if (result == null) {
                                        setState(
                                            () => error = 'Failed To Sign In');
                                      } else {
                                        SharedPreferencesManagement.setUserEmail(
                                            email);
                                        SharedPreferencesManagement.setUserType(
                                            MyConstants.USER_TYPE_TEACHER);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TeacherDashboard()));
                                      }
                                    }
                                  },
                                ),
                              ),
                            ]),
                          ),

                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 12.0),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
                                Text(
                                  'Dont have an account?',
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
                                                  TeacherSignUp()));
                                    },
                                    child: Text(
                                      "Click here to Sign up ",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w700)),
                                    ))
                              ],
                            ),
                          ),
                        ]))))
          ])),
        ));
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
}
