import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/get_course_by_teacher_id_provider.dart';
import 'package:techlearning_app/teacher/teacher_drawer.dart';
import 'package:techlearning_app/teacher/teacher_grades/teacher_grades.dart';
import 'package:techlearning_app/teacher/teacher_profile.dart';

import 'add_course_training.dart';
import 'edit_info.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class TeacherDashboard extends StatefulWidget {
  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  GetCoursesByTeacherIdProvider getCoursesProvider =
      GetCoursesByTeacherIdProvider();
  List<CourseModel> allTeacherCoursesList = [];
  Size size;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    UserModel userModel = await getUser();
    getCoursesTeacher(userModel.id);
  }

  getCoursesTeacher(int userId) async {
    var result = await getCoursesProvider.getAllCoursesByTeacherId(userId);
    setState(() {
      allTeacherCoursesList = result;
    });
  }

  Future<UserModel> getUser() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userString = pref.getString('userData');
      Map json = jsonDecode(userString);
      UserModel user = UserModel.fromJson(json);
      return user;
    } catch (e) {
      return null;
    }
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
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(children: [
                      SizedBox(height: size.height * 0.02),
                      getAllTeacherCoursesList(),

                      SizedBox(height: size.height * 0.02),
                      Row(children: [
                        getPrimaryClassesWidget(),
                      ]),
                      SizedBox(height: size.height * 0.02),

                      SizedBox(width: size.width * 0.01),
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
    return (getCoursesProvider.isLoading)
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : allTeacherCoursesList.length == 0
            ? Container()
            : SizedBox(
                height: 210,
                child: Column(
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
                                  child: Container(
                                    height: 160,
                                    width: 300,
                                    child: ListTile(
                                      title: Text(
                                        allTeacherCoursesList[index]
                                                .coursegrade +
                                            "\n" +
                                            allTeacherCoursesList[index]
                                                .coursename,
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
                                              allTeacherCoursesList[index]
                                                  .courseprice,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff6D747A),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  'Edit info',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF0A61B7),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditInformation(),
                                                  ),
                                                );
                                              })
                                        ],
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
        getGradeTile('assets/images/Rectangle 14.jpg', 'First grade', 1),
        getGradeTile('assets/images/Rectsec.jpg', 'Second grade', 2),
        getGradeTile('assets/images/RectThird.png', 'Third grade', 3),
        getGradeTile('assets/images/RectFour.png', 'Fourth grade', 4),
        getGradeTile('assets/images/RectFifth.png', 'Fifth grade', 5),
        getGradeTile('assets/images/RectSix.png', 'Sixth grade', 6),
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
          getGradeTile('assets/images/Rectangle 15.jpg', 'Seventh grade', 7),
          getGradeTile('assets/images/RectSeven.png', 'Eighth grade', 8),
          getGradeTile('assets/images/RectNinth.png', 'Ninth grade', 9),
          getGradeTile('assets/images/RectTen.png', 'Tenth grade', 10),
          getGradeTile('assets/images/RectEleven.png', 'Eleventh grade', 11),
          getGradeTile('assets/images/RectHight.png', 'High School', 12),
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
              context,
              MaterialPageRoute(
                  builder: (context) => AddCourseTrainingScreen()));
        },
      ),
    );
  }

  Widget getGradeTile(String imageName, String gradeName, int gradeId) {
    return Container(
        height: 120,
        width: 300,
        child: ListTile(
          title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherGradeScreen(
                          gradeId: gradeId, gradeName: gradeName)));
            },
            child: Image.asset(
              imageName,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.01),
              InkWell(
                  child: Text(gradeName,
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
                            builder: (context) => TeacherGradeScreen(
                                gradeId: gradeId, gradeName: gradeName)));
                  }),
              Container(
                child: Text(
                  "Math , Sciences and ...",
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
        ));
  }
}
