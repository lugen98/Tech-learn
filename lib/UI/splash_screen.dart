import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/student_dashboard.dart';
import 'package:techlearning_app/UI/teacher_dashboard.dart';
import 'package:techlearning_app/shared/my_constants.dart';
import 'package:techlearning_app/shared/shared_preferences_management.dart';
import 'package:techlearning_app/sign_up_sign_in/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SharedPreferencesManagement.init();
    super.initState();
    Timer(Duration(seconds: 7), () => goToNextPage());
  }

  goToNextPage() {
    String savedUserType = SharedPreferencesManagement.getUserType.toString();
    print('###################################');
    print('###################################');
    print('###################################');
    print('###################################');

    print(savedUserType);
    print('###################################');
    print('###################################');
    print('###################################');

    if (SharedPreferencesManagement.getUserType.toString() ==
        MyConstants.USER_TYPE_TEACHER.toString()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherDashboard()));
    } else if (SharedPreferencesManagement.getUserType.toString() ==
        MyConstants.USER_TYPE_STUDENT.toString()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentDashboardScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.30),
                Text('Tech',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF053361),
                            fontWeight: FontWeight.w600,
                            fontSize: 38))),
                Text('Learn',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFFFFD900),
                            fontWeight: FontWeight.w600,
                            fontSize: 38))),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[

                SvgPicture.asset(
                  "images/Frame 1.svg",
                height: size.height * 0.09

                  // width: 120,
                ),
                SizedBox(height: size.height * 0.03),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Image.asset("images/progressSoftlogo.jpg",
                      height: size.height * 0.09

                    // width: 120,
                  ),
                      Image.asset("images/codejologo.jpeg",
                          height: size.height * 0.20
                      )]),
                SizedBox(height: size.height * 0.04),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/gfplogo.jpeg",
                    height: size.height * 0.20

                  // width: 120,
                ),
                      Padding(padding: EdgeInsets.only(right: 20,left: 20),),
                      //
                      Image.asset("images/mafraq.jpeg",
                          height: size.height * 0.20
                      ),
]),

            ],
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.10),
                CircularProgressIndicator(),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Start",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Color(0xFF053361),
                  )),
                ),
              ],
            ),
          ),
        ]))));
  }
}
