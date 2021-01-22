import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/homeScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techlearning_app/login&signin/StudentSignIn.dart';
import 'package:techlearning_app/login&signin/TeacherSignIn.dart';


class FirstSignIn extends StatefulWidget {
  @override
  _FirstSignInState createState() => _FirstSignInState();
}

class _FirstSignInState extends State<FirstSignIn> {
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
              Padding(
                padding: EdgeInsets.all(1),
              ),
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
              Padding(padding: EdgeInsets.only(right: 30,left: 30) ),
            ],
          ),
          leading: Container(

            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainHomePage()));
              },
              icon: Icon(

                Icons.arrow_back,
                color:  Color(0xFF053361),
              ),
            ),
          ),
        ),
        body: Container(

            child: SingleChildScrollView(
                child: Column(children: <Widget>[

                  Container(

                    child:Column(

                      children: <Widget>[
                        SizedBox(height: size.height * 0.05),
                        Text('Who are you?',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w700,
                                fontSize: 18))),

                      ],
                    ),
                  ),

                  Container (
                    child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height * 0.05),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => TeacherSignIn()));
                                },
                                color:  Color(0xFFFFD900),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                InkWell(
                                  onTap: (){ Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>TeacherSignIn()
                                  ));},
                                  child: Text(
                                    "Teacher",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF053361),
                                        fontWeight: FontWeight.w700)),
                                  ),
                                )
                            ),

                          )
                        ]
                    ),

                  ),

                  Container (
                    child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height * 0.04),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => StudentSignIn()));
                                },
                                color: Color(0xFFFFD900),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                child:
                                InkWell(
                                  onTap: (){ Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>StudentSignIn()
                                  ));},
                                  child: Text(
                                    "Student",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF053361),
                                        fontWeight: FontWeight.w700)),
                                  ),
                                )
                            ),


                          )
                        ]
                    ),

                  ),
                  Container(
                    child: Column(
                        children: <Widget>[
                    SizedBox(height: size.height * 0.02),
                    SvgPicture.asset("images/OBJECTS.svg",
                      width: size.width * 1.5,
                    ),
                  ])
                    ),

                ]
                )

            )
        )
    );
  }
}
