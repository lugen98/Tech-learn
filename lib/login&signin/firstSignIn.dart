import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/homeScreen.dart';
import 'package:techlearning_app/UI/teacherReg.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/login&signin/register.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    right: 30, left: 20),
              ),
              Text('Tech',
                  style: TextStyle(
                      color:  Color(0xFF053361),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Text('Learn',
                  style: TextStyle(
                      color:  Color(0xFFFFD900),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            width: 40,
            height: 60,
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 28,
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: 7, right: 50, left: 40, bottom: 2),
                  ),

                  Container(
                    child:Row (
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 65, right: 80, left: 40, bottom: 20),
                        ),
                        Text('Who are you?',
                            style: TextStyle(
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),

                      ],
                    ),
                  ),

                  Container (
                    child: Column(
                        children: <Widget>[
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
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF053361),
                                        fontWeight: FontWeight.w700),
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: 18, right: 50, left: 40, bottom: 7),
                          ),
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
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF053361),
                                        fontWeight: FontWeight.w700),
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
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30, right: 80, left: 80, bottom: 7),
                        ),
                        SvgPicture.asset("images/OBJECTS.svg"),

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
