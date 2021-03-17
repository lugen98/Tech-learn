import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/student/view_course_info.dart';
import 'package:techlearning_app/student/grades/grades.dart';
import 'package:techlearning_app/student/student_drawer.dart';
import 'package:techlearning_app/student/student_profile.dart';

class StudentDashboardScreen extends StatefulWidget {
  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
              backgroundColor: Colors.white,
              drawer: Drawer(
                child: StudentDrawer(),
              ),
              appBar: AppBar(
                leading: Builder(builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    color: Color(0xFF053361),
                    iconSize: 30,
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                }),
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
                        iconSize: 37,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentProfileScreen()));
                        },
                      ),
                      padding: EdgeInsets.only(top: 5, right: 20)),
                ],
              ),
              body: Container(
                  child: ListView(children: <Widget>[
                SizedBox(height: size.height * 0.03),
                getPrimaryWidget(),
                SizedBox(height: size.height * 0.02),
                getPrimaryClassesList(),
                SizedBox(height: size.height * 0.03),
                getSecondaryWidget(),
                SizedBox(height: size.height * 0.02),
                getSecondaryClassesList(),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Text(
                    "Training Courses",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF053361),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                    child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewCourseInfo()));
                        },
                        child: Text(
                          'Search for training courses',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF0A61B7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Color(0xFF0A61B7),
                      iconSize: 25,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewCourseInfo()));
                      },
                    ),
                  ],
                )),
                SizedBox(height: size.height * 0.02),
              ]))),
        ));
  }

  Widget getPrimaryWidget() {
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
                      builder: (context) =>
                          GradeScreen(gradeId: gradeId, gradeName: gradeName)));
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
                            builder: (context) => GradeScreen(
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

  Widget getPrimaryClassesList() {
    return Container(
      height: 218,
      width: 360,
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

  Widget getSecondaryWidget() {
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
        height: 218,
        width: 360,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          getGradeTile('assets/images/Rectangle 15.jpg', 'Seventh grade', 7),
          getGradeTile('assets/images/RectSeven.png', 'Eighth grade', 8),
          getGradeTile('assets/images/RectNinth.png', 'Ninth grade', 9),
          getGradeTile('assets/images/RectTen.png', 'Tenth grade', 10),
          getGradeTile('assets/images/RectEleven.png', 'Eleventh grade', 11),
          getGradeTile('assets/images/RectHight.png', 'High School', 12),
        ]));
  }
}
