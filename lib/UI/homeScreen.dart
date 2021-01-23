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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
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
                      SizedBox(height: size.height * 0.03),
                      SvgPicture.asset(
                        "images/Frame 1.svg",
                        height: size.height * 0.30,
                      ),
              //
                    //  SvgPicture.asset("images/Frame 1.svg"),
                    ]
                  )
                ),

          Container(
            child: Column(children: <Widget>[
              SizedBox(height: size.height * 0.10),
              SizedBox(
                width: 320,
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
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.02),
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
                    )),
                SizedBox(height: size.height * 0.04),

              ],
            ),
          ),
        ]))));
  }

  void openRegPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstSignUp()));
  }
}
