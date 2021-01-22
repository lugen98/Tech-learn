import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/homeScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:SingleChildScrollView(
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
            child: Column(children: <Widget>[
              SizedBox(height: size.height * 0.04),
              SvgPicture.asset(
                "images/Frame 1.svg",
                height: size.height * 0.25,
              ),
              ],
            ),
          ),
              SizedBox(height: size.height * 0.06),
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
                      color: Color(0xFF053361),)),
                ),

              ],
            ),
          ),


        ]
    )
    )
        )
    );
  }
}
