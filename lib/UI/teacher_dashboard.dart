import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/edit_info.dart';
import 'package:techlearning_app/menu/teacher_drawer.dart';
import 'package:techlearning_app/profile/teacher_profile.dart';
import 'package:techlearning_app/grades/primary/fifth_grade.dart';
import 'package:techlearning_app/grades/primary/first_grade.dart';
import 'package:techlearning_app/grades/primary/four_grade.dart';
import 'package:techlearning_app/grades/primary/seconde_grade.dart';
import 'package:techlearning_app/grades/primary/sixth_grade.dart';
import 'package:techlearning_app/grades/primary/third_grade.dart';
import 'package:techlearning_app/grades/secondary/eight_grade.dart';
import 'package:techlearning_app/grades/secondary/eleventh_grade/eleventh_grade.dart';
import 'package:techlearning_app/grades/secondary/high_school/high_school.dart';
import 'package:techlearning_app/grades/secondary/ninth_grade.dart';
import 'package:techlearning_app/grades/secondary/seventh_grade.dart';
import 'package:techlearning_app/grades/secondary/tenth_grade.dart';
import 'course_detailes.dart';

var scaffoldkey = GlobalKey<ScaffoldState>();
class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              key: scaffoldkey,
              drawer: Drawer(
                child: TeacherDrawer(),
              ),
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  color: Color(0xFF053361),
                  iconSize: 27,
                  onPressed: () {
                    scaffoldkey.currentState.openDrawer();
                  },
                ),
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
                elevation: 5,
                actions: <Widget>[
                  Padding(
                      child: IconButton(
                        icon: Icon(Icons.account_circle),
                        color: Colors.grey,
                        iconSize: 35,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>TeacherProfile()));
                        },
                      ),
                      padding: EdgeInsets.only(right: 15.0)),
                ],
              ),
              body: Container(

                  child: ListView(children: <Widget>[
                SizedBox(height: size.height * 0.03),
                    SizedBox(
                      width: 134,
                      height:134,
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[

                                Padding(padding:EdgeInsets.only(left: 16.0),),
                                SizedBox(height: size.height* 0.03),

                                Text('Ahmad Ali',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFF053361),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                               Padding(padding:EdgeInsets.only(left: 120.0,right: 20.0),),
                                SizedBox(height: size.width* 0.03),

                                Text("JOD 20",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(

                                        color: Color(0xFF053361),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),

                                ),

                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Padding(padding:EdgeInsets.only(left: 16.0),),

                                SizedBox(height: size.width* 0.03),
                                SizedBox(
                                  width: 125,
                                  height: 21,
                                  child:
                                  Text("Maths-First grade",
                                    // textAlign:TextAlign.left ,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF053361),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            //////////////////////

                            Row(

                              children: <Widget>[
                                Padding(padding:EdgeInsets.only(bottom: 80.0,right: 240)),



                                SizedBox(height: size.height* 0.03),
                                SizedBox(
                                  width: 65,
                                  height: 21,
                                  child:
                                  InkWell(

                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>EditInformation(),
                                        ),
                                      );
                                    },
                                    child:Text("Edit Info",
                                      // textAlign:TextAlign.left ,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Color(0xFF0A61B7),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,

                                          ),   fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),




                          ],
                        ),
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0xFFC8CACC),width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),


                SizedBox(height: size.height * 0.02),

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
                            Container(
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


                          ]),
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
                                    title:  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SeventhGrade()));
                                      },
                                      child:
                                      Image.asset(
                                        "images/Rectangle 15.jpg",
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
                                                    builder: (context) => SeventhGrade()));
                                          },
                                          child:
                                          Text("Seventh grade",
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
                                                builder: (context) => EighthGrade()));
                                      },
                                      child:
                                      Image.asset(
                                        "images/RectSeven.png",
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
                                                    builder: (context) => EighthGrade()));
                                          },
                                          child:
                                          Text("Eighth grade",
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
                                                builder: (context) => NinthGrade()));
                                      },
                                      child:
                                      Image.asset(
                                        "images/RectNinth.png",
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
                                                    builder: (context) => NinthGrade()));
                                          },
                                          child:
                                          Text("Ninth grade",
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
                                    title:
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => TenthGrade()));
                                      },
                                      child:
                                      Image.asset(
                                        "images/RectTen.png",
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
                                                    builder: (context) => TenthGrade()));
                                          },
                                          child:
                                          Text("Tenth grade",
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
                                    title:
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EleventhGrade()));
                                      },
                                      child:
                                      Image.asset(
                                        "images/RectEleven.png",
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
                                                    builder: (context) => EleventhGrade()));
                                          },
                                          child:
                                          Text("Eleventh grade",
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
                                              builder: (context) => HighSchool()));
                                    },
                                    child:
                                    Image.asset(
                                      "images/RectHight.png",
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
                                                    builder: (context) => HighSchool()));
                                          },
                                          child:
                                          Text("High school",
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
                SizedBox(
                  height: 49,
                  width: 328,
                  child: TextFormField(
                    validator: (val) =>
                    val.isEmpty ? 'please Enter Course Name' : null,
                    decoration: InputDecoration(
                        hintText: "Enter Course Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC8CACC),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                    child: Column(children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: 328,
                    height: 49,
                    child: RaisedButton(
                      color: Color(0xFFFFD900),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w700)),
                      ),
                      //CourseDetails
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddCourse()));
                      },
                    ),
                  ),

                SizedBox(height: size.height * 0.02),
             ]))])),

            )));
  }
}
