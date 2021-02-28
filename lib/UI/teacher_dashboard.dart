import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/entities/GetCoursebyTeacherId.dart';
import 'package:techlearning_app/menu/teacher_drawer.dart';
import 'package:techlearning_app/profile/teacher_profile.dart';
import 'package:techlearning_app/services/auth_provider.dart';
import 'package:techlearning_app/services/get_course_by_teacher_id_provider.dart';
import 'package:techlearning_app/shared/app_urls.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/fifth_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/first_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/four_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/seconde_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/sixth_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_primary/third_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/eight_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/eleventh_grade/eleventh_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/high_school/high_school.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/ninth_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/seventh_grade.dart';
import 'package:techlearning_app/teacher_grades/teacher_secondary/tenth_grade.dart';
import 'course_detailes.dart';
import 'edit_info.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class TeacherDashboard extends StatefulWidget {
  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {

  GetCoursesByTeacherIdProvider getCoursesProvider = GetCoursesByTeacherIdProvider();
  List<GetCourseByTeacherId> allTeacherCoursesList = [];
  Size size;
  @override
  void initState() {
    super.initState();
    getCoursesTeacher();

  }

  getCoursesTeacher() async {
    var result = await getCoursesProvider.getAllCoursesByTeacherId(0);
    setState(() {
      allTeacherCoursesList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Colors.white,
                key: scaffoldKey,
                drawer: Drawer(
                  child: TeacherDrawer(),
                ),
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    color: Color(0xFF053361),
                    iconSize: 27,
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  title: Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                      color: Color(0xFF0A61B7),
                    )),
                  ),
                  centerTitle: true,

                  backgroundColor: Colors.white,
                  elevation: 5,
                  actions: <Widget>[
                    Padding(
                        child: IconButton(
                          icon: Icon(Icons.account_circle),
                          color: Colors.grey,
                          iconSize: 35,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherProfile()));
                          },
                        ),
                        padding: EdgeInsets.only(right: 15.0)),
                  ],
                ),
                body:
                SingleChildScrollView(
                  child: Container(
                    child: Column(children: [
                     SizedBox(height: size.height * 0.02),
                    getAllTeacherCoursesList(),

                      SizedBox(height: size.height * 0.02),
                    Row(children: [
                      getPrimaryClassesWidget(),
                      ]),
                      SizedBox(height: size.height * 0.02),

                      SizedBox(width: size.width*0.01),
                      getPrimaryClassesList(),

                      SizedBox(height: size.height * 0.03),
                    Row(children: [
                      getSecondaryClassesWidget(),
                      ]),
                      SizedBox(height: size.height * 0.02),
                      getSecondaryClassesList(),
                    Row(children: [
                      getTrainingCoursesWidget(),
                      ]),
                      SizedBox(height: size.height * 0.02),
                     // getAddCourseWidget(),
                    //  SizedBox(height: size.height * 0.02),
                      getNextButton(),
                      SizedBox(height: size.height * 0.04),
                    ]),
                  ),
                ))));
  }

  Widget getAllTeacherCoursesList() {
        return (allTeacherCoursesList == null && getCoursesProvider.isLoading)
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : SizedBox(
                height: 210,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                      child: Container(
                        padding: EdgeInsets.only(right: 20, left: 10),

                        child: Text(
                          "Your Lectures",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                                color: Color(0xff053361),
                              )),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.01),

                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                        itemCount: allTeacherCoursesList.length,
                          itemBuilder: (context, index) {
                        return Column(children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  )),
                              child:
                                  Container(
                                    height: 160,
                                    width: 300,
                                    child: ListTile(
                                      title: Text(
                                        allTeacherCoursesList[index].coursegrade+ "\n"+
                                            allTeacherCoursesList[index].coursename,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          color: Color(0xff053361),
                                        )),
                                      ),

                                      subtitle: Column(

                                       // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              allTeacherCoursesList[index].courseprice,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff6D747A),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            child:
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child:
                                             Text(
                                              'Edit info',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color:  Color(0xFF0A61B7),
                                              ),
                                            ),
                                             ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditInformation(),
                                ),
                              );
                            } )],
                                      ),
                                    ),
                                  ),

                            ),
                          ),

                        ]);
                      }),
                    ),
                  ],
                ));

  }

  Widget getPrimaryClassesWidget() {
    return Container(
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
    );
  }

  Widget getPrimaryClassesList() {
    return Container(
      height: 200,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Container(
            height: 160,
            width: 300,
            child: ListTile(
              title: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstGrade()));
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
                                builder: (context) => FirstGrade()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondGrade()));
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
                              builder: (context) => SecondGrade()));
                    },
                    child: Text("Second grade",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff053361),
                        ))),
                  ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdGrade()));
                },
                child: Image.asset(
                  "images/RectThird.png",
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
                              builder: (context) => ThirdGrade()));
                    },
                    child: Text("Third grade",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff053361),
                        ))),
                  ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FourthGrade()));
                },
                child: Image.asset(
                  "images/RectFour.png",
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
                              builder: (context) => FourthGrade()));
                    },
                    child: Text("Fourth grade",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff053361),
                        ))),
                  ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FifthGrade()));
                },
                child: Image.asset(
                  "images/RectFifth.png",
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
                              builder: (context) => FifthGrade()));
                    },
                    child: Text("Fiveth grade",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff053361),
                        ))),
                  ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SixthGrade()));
                },
                child: Image.asset(
                  "images/RectSix.png",
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
                              builder: (context) => SixthGrade()));
                    },
                    child: Text("Sixth grade",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff053361),
                        ))),
                  ),
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
    );
  }

  Widget getSecondaryClassesWidget() {
    return Container(
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
    );
  }

  Widget getSecondaryClassesList() {
    return Container(
        height: 200,

        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
              height: 160,
              width: 300,
              child: ListTile(
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeventhGrade()));
                  },
                  child: Image.asset(
                    "images/Rectangle 15.jpg",
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
                                builder: (context) => SeventhGrade()));
                      },
                      child: Text("Seventh grade",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EighthGrade()));
                  },
                  child: Image.asset(
                    "images/RectSeven.png",
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
                                builder: (context) => EighthGrade()));
                      },
                      child: Text("Eighth grade",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NinthGrade()));
                  },
                  child: Image.asset(
                    "images/RectNinth.png",
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
                                builder: (context) => NinthGrade()));
                      },
                      child: Text("Ninth grade",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TenthGrade()));
                  },
                  child: Image.asset(
                    "images/RectTen.png",
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
                                builder: (context) => TenthGrade()));
                      },
                      child: Text("Tenth grade",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
                            builder: (context) => EleventhGrade()));
                  },
                  child: Image.asset(
                    "images/RectEleven.png",
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
                                builder: (context) => EleventhGrade()));
                      },
                      child: Text("Eleventh grade",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HighSchool()));
                },
                child: Image.asset(
                  "images/RectHight.png",
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
                                builder: (context) => HighSchool()));
                      },
                      child: Text("High school",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff053361),
                          ))),
                    ),
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
        ]));
  }

  Widget getTrainingCoursesWidget() {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 10),
      child: Text(
        "Training Courses",
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Color(0xFF053361),
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ),
    );
  }



  Widget getNextButton() {
    return SizedBox(
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCourse()));
        },
      ),
    );
  }
}


