import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/teacher/add_course.dart';

class LiteraryStudies extends StatefulWidget {
  @override
  _LiteraryStudiesState createState() => _LiteraryStudiesState();
}

class _LiteraryStudiesState extends State<LiteraryStudies> {
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
            Text('Eleventh grade-Literary Studies',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w600,
                        fontSize: 17))),
          ],
        ),
        leading: Container(
          child: IconButton(
            color: Color(0xFF053361),
            iconSize: 27,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF053361),
              size: 30,
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(primary: false, children: <Widget>[
          SizedBox(height: size.height * 0.02),
          Container(
            height: MediaQuery.of(context).size.height - 127,
            child: ListView(children: <Widget>[
              InkWell(
                child: _bulidlevelItem("Math - 1st Semester"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Math - 2nd Semester"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Islamic Sciences "),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Islamic Education"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Financial Culture"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Geography"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Jordan History"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("English"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Modern And Contemporary\nArab History"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Arabic Specialty"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Communication Skills"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
              InkWell(
                child: _bulidlevelItem("Computer Science"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCourseScreen()));
                },
              ),
            ]),
          )
        ]),
      ),
    );
  }

  Widget _bulidlevelItem(String levelName) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(levelName,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w500,
                                fontSize: 18))),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            color: Color(0xFF053361),
            iconSize: 30,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCourseScreen()));
            },
          ),
        ],
      ),
    );
  }
}
