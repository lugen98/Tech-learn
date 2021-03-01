import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/UI/student_dashboard.dart';
import 'package:techlearning_app/UI/teacher_dashboard.dart';
import 'package:techlearning_app/entities/registerModel.dart';
import 'package:techlearning_app/shared/my_constants.dart';
import 'package:techlearning_app/sign_up_sign_in/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () => goToNextPage());
  }

  goToNextPage() async {
    UserModel userModel = await getUser();
    if(userModel==null){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainHomePage()));
    }
   else if (userModel.usertype == MyConstants.USER_TYPE_TEACHER.toString()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherDashboard()));
    } else if (userModel.usertype == MyConstants.USER_TYPE_STUDENT.toString()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentDashboardScreen()));
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
                SizedBox(height: size.height * 0.20),
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
                Padding(padding:EdgeInsets.only(right: 15.0),),

                SvgPicture.asset(
                  "images/Frame 1.svg",
                height: size.height * 0.07

                  // width: 120,
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

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

                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(padding:EdgeInsets.only(right: 15.0),),

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
 Future<UserModel> getUser() async {
 try{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userString = pref.getString('userData');
    Map json = jsonDecode(userString);
    UserModel user = UserModel.fromJson(json);
    return user;
    }catch(e){
    return null;
    }
  }


}
