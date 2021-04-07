import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/_common_widgets/or_divider.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/auth_provider.dart';
import 'package:techlearning_app/sign_in_page.dart';
import 'package:techlearning_app/teacher/teacher_dashboard.dart';

class TeacherSignUp extends StatefulWidget {
  @override
  _TeacherSignUpState createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  Size size;
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
    size = MediaQuery.of(context).size;
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
        body: _registerProvider.isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : _buildMainWidget());
  }

  Widget _buildMainWidget() {
    return Container(
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
        getSignUpGoogle(),
        OrDivider(),
        Container(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: size.height * 0.01),
                      getFirstName(),
                      SizedBox(height: size.height * 0.03),
                      getLastName(),
                      SizedBox(height: size.height * 0.03),
                      getEmail(),
                      SizedBox(height: size.height * 0.03),
                      getPassword(),
                      SizedBox(height: size.height * 0.03),
                      getDegree(),
                      SizedBox(height: size.height * 0.03),
                      getMajor(),
                      SizedBox(height: size.height * 0.03),
                      getPhoneNumber(),
                      SizedBox(height: size.height * 0.02),
                      getTerms(),
                      getPrivacyPolicy(),
                      SizedBox(
                        height: 12.0,
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ),
                      getSignUpButton(),
                      //getAlreadyHaveAccount(),
                      SizedBox(height: size.height * 0.02),
                    ]))))
      ])),
    );
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  Widget getSignUpGoogle() {
    return Container(
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
          padding:
              EdgeInsets.only(top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
          onPressed: () async {
            // await _auth.signInGoogle();
          },
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/search 1.svg',
                height: 20.0,
                width: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 40, left: 50.0),
                  child: Text(
                    "Sign up with Google",
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
    ]));
  }

  Widget getAlreadyHaveAccount() {
    return Container(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
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
    );
  }

  Widget getFirstName() {
    return SizedBox(
      width: 328,
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter First Name' : null,
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
    );
  }

  Widget getLastName() {
    return SizedBox(
      width: 328,
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter Last Name' : null,
        decoration: InputDecoration(
            labelText: 'Last name',
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
    );
  }

  Widget getEmail() {
    return SizedBox(
      width: 328,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (val) => val.isEmpty ? 'Enter email' : null,
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
    );
  }

  Widget getPassword() {
    return SizedBox(
      width: 328,
      child: TextFormField(
          validator: (val) =>
              val.length < 6 ? 'password Should be more than 6' : null,
          obscureText: !isHidePassword,
          decoration: InputDecoration(
              hintText: "Password 6+ characters",
              labelText: "Password",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                    isHidePassword ? Icons.visibility : Icons.visibility_off),
                color: isHidePassword ? Color(0xFF0A61B7) : Colors.grey,
                onPressed: () {
                  _togglePasswordVisability();
                },
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFC8CACC),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10))),
          onChanged: (val) {
            setState(() => password = val);
          }),
    );
  }

  Widget getMajor() {
    return SizedBox(
      width: 328,
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter your Major' : null,
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
    );
  }

  Widget getDegree() {
    return SizedBox(
      width: 328,
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Enter your Degree' : null,
        decoration: InputDecoration(
            hintText: 'Degree',
            labelText: 'Degree',
            prefixIcon: Image.asset(
              'assets/images/Degree Icon.png',
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
    );
  }

  Widget getPhoneNumber() {
    return SizedBox(
      width: 328,
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
    );
  }

  Widget getSignUpButton() {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: size.height * 0.03),
        SizedBox(
          width: 328,
          height: 49,
          child: RaisedButton(
              color: Color(0xFFFFD900),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w700)),
              ),
              onPressed: () {
                doSignUp();
              }),
        ),
      ]),
    );
  }

  void doSignUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _registerProvider.isLoading = true;
      });
      UserModel result = await _registerProvider.register(
          firstName, lastName, email, password, degree, major, phoneNumber, 0);
      setState(() {
        _registerProvider.isLoading = false;
      });
      if (result == null) {
        setState(() => error = 'Failed To Sign In');
      } else {
        saveUserInSharedPreferences(result);
      }
    }
  }

  Widget getTerms() {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
    ]));
  }

  Widget getPrivacyPolicy() {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      InkWell(
        onTap: () {},
        child: Text('Privacy Policy',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFF0A61B7),
                    fontWeight: FontWeight.w500,
                    fontSize: 12))),
      )
    ]));
  }

  saveUserInSharedPreferences(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userModel);
    pref.setString('userData', user);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TeacherDashboard()));
  }
}
