import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/sign_up_sign_in/teacher/teacher_sign_in.dart';

class TeacherSign2 extends StatefulWidget {
  @override
  _TeacherSign2State createState() => _TeacherSign2State();
}

class _TeacherSign2State extends State<TeacherSign2> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isHidePassword = false;
  bool isShowPassword = false;
  //text filed state
  String email = '';
  String password = '';
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
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: size.height * 0.04),
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
                                      "Continue",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF053361),
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        // dynamic result =
                                        //     await _auth.teacherRegisterEP(
                                        //         major, degree, email, password);
                                        // if (result == email) {
                                        //   setState(() => error =
                                        //       'The email address is already in use by another account');
                                        // } else {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               TeacherDashboard()));
                                        // }
                                      }
                                    }),
                              ),
                            ]),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
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
                        ]))))
          ])),
        ));
  }
}
