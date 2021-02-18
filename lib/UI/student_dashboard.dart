import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/grades/primary/fifth_grade.dart';
import 'package:techlearning_app/grades/primary/first_grade.dart';
import 'package:techlearning_app/grades/primary/four_grade.dart';
import 'package:techlearning_app/grades/primary/seconde_grade.dart';
import 'package:techlearning_app/grades/primary/sixth_grade.dart';
import 'package:techlearning_app/grades/primary/third_grade.dart';
import 'package:techlearning_app/menu/student_drawer.dart';

class StudentDashboardScreen extends StatefulWidget {
  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Welcome",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xff6D747A),
                )),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(6.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    "Lugain Fareed",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xff0A61B7),
                    )),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 10,
              actions: <Widget>[
                Padding(
                    child: IconButton(
                      icon: Icon(Icons.account_circle),
                      color: Colors.grey,
                      iconSize: 35,
                      onPressed: () {},
                    ),
                    padding: EdgeInsets.only(right: 15.0)),
              ],
            ),
            body: Container(
                child: ListView(children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Text(
                  "Primary Classes",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff053361),
                  )),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: 218,
                width: 360,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print('derp');

                        // setState(() {
                        // });
                      },
                      child: Container(
                          height: 120,
                          width: 300,
                          child: ListTile(
                            title: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstGrade()));
                              },
                              child: Image.asset(
                                "images/Rectangle 14.jpg",
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: size.height * 0.01),
                                InkWell(
                                    child: Text("First grade",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Color(0xff053361),
                                        ))),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FirstGrade()));
                                    }),
                                Container(
                                  child: Text(
                                    "Maths , Sciences and ...",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Color(0xff6D747A))),
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                        height: 300,
                        width: 300,
                        child: ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondGrade()));
                            },
                            child: Image.asset(
                              "images/Rectsec.jpg",
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.height * 0.01),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SecondGrade()));
                              },
                            child:
                              Text("Second grade",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff053361),
                                  ))),),
                              Container(
                                child: Text(
                                  "Maths , Sciences and ...",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xff6D747A))),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        height: 300,
                        width: 300,
                        child: ListTile(
                          title:InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThirdGrade()));
                            },
                            child: Image.asset(
                            "images/RectThird.png",
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.height * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThirdGrade()));
                            },
                            child:
                              Text("Third grade",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff053361),
                                  ))),),
                              Container(
                                child: Text(
                                  "Maths , Sciences and ...",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xff6D747A))),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        height: 300,
                        width: 300,
                        child: ListTile(
                          title:InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FourthGrade()));
                            },
                            child: Image.asset(
                            "images/RectFour.png",
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.height * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FourthGrade()));
                            },
                            child:
                              Text("Fourth grade",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff053361),
                                  ))),),
                              Container(
                                child: Text(
                                  "Maths , Sciences and ...",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xff6D747A))),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        height: 300,
                        width: 300,
                        child: ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FifthGrade()));
                            },
                            child: Image.asset(
                            "images/RectFifth.png",
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.height * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FifthGrade()));
                            },
                            child:
                              Text("Fiveth grade",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff053361),
                                  ))),),
                              Container(
                                child: Text(
                                  "Maths , Sciences and ...",
                                  maxLines: null,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xff6D747A))),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        height: 300,
                        width: 300,
                        child: ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SixthGrade()));
                            },
                            child: Image.asset(
                            "images/RectSix.png",
                          ),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.height * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SixthGrade()));
                            },
                            child:
                              Text("Sixth grade",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff053361),
                                  ))),),
                              Container(
                                child: Text(
                                  "Maths , Sciences and ...",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Color(0xff6D747A))),
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.only(right: 25, left: 15),
                child: Text(
                  "Secondry Classes",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff053361),
                  )),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                  height: 218,
                  width: 360,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                            height: 120,
                            width: 300,
                            child: ListTile(
                              title: Image.asset(
                                "images/Rectangle 15.jpg",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("Seventh grade",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            height: 300,
                            width: 300,
                            child: ListTile(
                              title: Image.asset(
                                "images/RectSeven.png",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("Eighth grade",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            height: 300,
                            width: 300,
                            child: ListTile(
                              title: Image.asset(
                                "images/RectNinth.png",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("Ninth grade",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            height: 300,
                            width: 300,
                            child: ListTile(
                              title: Image.asset(
                                "images/RectTen.png",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("Tenth grade",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            height: 300,
                            width: 300,
                            child: ListTile(
                              title: Image.asset(
                                "images/RectEleven.png",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("Eleventh grade",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          height: 300,
                          width: 300,
                          child: ListTile(
                            title: Image.asset(
                              "images/RectHight.png",
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: size.height * 0.01),
                                  Text("High school",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xff053361),
                                      ))),
                                  Container(
                                    child: Text(
                                      "Maths , Sciences and ...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                              color: Color(0xff6D747A))),
                                      maxLines: null,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ])),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Text(
                  "Training Courses",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Search for training courses',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF0A61B7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              InkWell(
                onTap: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                onPressed: () {},
              ),
            ])),
            drawer: Drawer(
              child: StudentDrawer(),
            ),
          ),
        ));
  }
}
