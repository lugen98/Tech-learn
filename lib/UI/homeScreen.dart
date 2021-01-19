import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/login&signin/firstsignup.dart';
import 'package:techlearning_app/login&signin/firstSignIn.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 75, right: 50, left: 25, bottom: 80),
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
                      top: 86.96, right: 80, left: 80, bottom: 10),
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: 1, right: 21, left: 31, bottom: 10),
              ),
              SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstSignUp()));
                    },
                    color: Color(0xFFFFD900),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: openRegPage,
                      child: Text(
                        "Create Free Account",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w700)),
                      ),
                    )),
              )
            ]),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 1, right: 16, left: 19, bottom: 50),
                ),
                Text(
                  'Already have an account ?',
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
                              builder: (context) => FirstSignIn()));
                    },
                    child: Text(
                      " Click here to log in ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF0A61B7),
                              fontWeight: FontWeight.w700)),
                    ))
              ],
            ),
          )
        ]))));
  }

  void openRegPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstSignUp()));
  }
}
