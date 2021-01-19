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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 52, right: 40, left: 40, bottom: 86.96),
                ),
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

                SvgPicture.asset("images/Frame 1.svg"),
                Padding(
                  padding: EdgeInsets.only(
                      top: 86.96, right: 80, left: 80, bottom: 98),
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding:
                  EdgeInsets.only(top: 7, right: 164, left: 164, bottom: 7),
                ),
                Text(
                  "Start",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                      color: Color(0xFF053361),)),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: 7, right: 164, left: 164, bottom: 7),
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
