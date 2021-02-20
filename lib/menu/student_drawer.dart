import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/student_dashboard.dart';
import 'package:techlearning_app/menu/settings.dart';
import 'package:techlearning_app/profile/student_profile.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/sign_up_sign_in/home_screen.dart';

class StudentDrawer extends StatefulWidget {
  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Padding(padding: EdgeInsets.only(left: 6,right: 6),),
                  Image.asset("images/frame1.jpg"

                  ),
                  SizedBox(
                   width: 10.0,
                  ),
                  Text(
                    "Heyam Zyoud",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0A61B7),
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
                  builder: (context) => StudentDashboardScreen()));
        },
        leading: Image.asset(
          'images/home.jpg',
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
              MaterialPageRoute(builder: (context) => StudentProfileScreen()));
        },
        leading: Image.asset(
          'images/user (3) 1.png',
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
        onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );},
        leading: Image.asset(
          'images/settings 1.png',
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
          'images/information-button 1.png',
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

      ListTile(
        onTap: () {},
        leading: Image.asset(
          'images/global 1.png',
          height: 30,
          width: 30,
        ),
        title: Text(
          "العربية",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w600,
            fontSize: 17,
          )),
        ),
      ),

      ListTile(
        onTap: () {
          openSignOutPage();
        },
        leading: Image.asset(
          'images/logout.png',
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

  void openSignOutPage() async {
    await _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainHomePage()));
  }
}
