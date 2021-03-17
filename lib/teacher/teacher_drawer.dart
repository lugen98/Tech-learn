import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/home_screen.dart';
import 'package:techlearning_app/menu/settings.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/teacher/teacher_dashboard.dart';
import 'package:techlearning_app/teacher/teacher_profile.dart';

class TeacherDrawer extends StatefulWidget {
  @override
  _TeacherDrawerState createState() => _TeacherDrawerState();
}

class _TeacherDrawerState extends State<TeacherDrawer> {
  final AuthService _auth = AuthService();
  UserModel currentUser = UserModel();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return currentUser == null
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Container(
            child: Column(children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset("assets/images/frame1.jpg")),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            currentUser.firstname + ' ' + currentUser.lastname,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0A61B7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's Add the button for the Menu
            //and let's copy that and modify it
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherDashboard()));
              },
              leading: Image.asset(
                'assets/images/home.jpg',
                height: 30,
                width: 30,
              ),
              title: Text(
                "Home",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeacherProfile()));
              },
              leading: Image.asset(
                'assets/images/user (3) 1.png',
                height: 30,
                width: 30,
              ),
              title: Text(
                "Profile",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              leading: Image.asset(
                'assets/images/settings 1.png',
                height: 30,
                width: 30,
              ),
              title: Text(
                "Settings",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
              ),
            ),

            ListTile(
              onTap: () {},
              leading: Image.asset(
                'assets/images/information-button 1.png',
                height: 30,
                width: 30,
              ),
              title: Text(
                "About",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
              ),
            ),

            // ListTile(
            //   onTap: () {},
            //   leading: Image.asset(
            //     'assets/images/global 1.png',
            //     height: 30,
            //     width: 30,
            //   ),
            //   title: Text(
            //     "العربية",
            //     style: GoogleFonts.poppins(
            //         textStyle: TextStyle(
            //       color: Color(0xFF053361),
            //       fontWeight: FontWeight.w600,
            //       fontSize: 17,
            //     )),
            //   ),
            // ),

            ListTile(
              onTap: () {
                openSignOutPage();
              },
              leading: Image.asset(
                'assets/images/logout.png',
                height: 30,
                width: 30,
              ),
              title: Text(
                "Sign out",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                )),
              ),
            ),
          ]));
  }

  void getUser() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userString = pref.getString('userData');
      Map json = jsonDecode(userString);
      currentUser = UserModel.fromJson(json);
      setState(() {});
    } catch (e) {}
  }

  void openSignOutPage() async {
    await //_auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainHomePage()));
  }
}
