import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/view_info.dart';
import 'package:techlearning_app/services/courses_provider.dart';
import 'package:techlearning_app/entities/courseListModel.dart';

class ViewCourseInfo extends StatefulWidget {
  @override
  _ViewCourseInfoState createState() => _ViewCourseInfoState();
}

class _ViewCourseInfoState extends State<ViewCourseInfo> {
  CoursesProvider getCoursesProvider = CoursesProvider();
  List<CourseListModel> allCoursesList = [];
  Size size;

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  getCourses() async {
    var result = await getCoursesProvider.getAllCourses();
    setState(() {
      allCoursesList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //APP Bar
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Course',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
              Padding(padding: EdgeInsets.only(right: 5)),
              Text('Training',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
              Padding(padding: EdgeInsets.only(right: 30, left: 30)),
            ],
          ),
          leading: Container(
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF053361),
              ),
            ),
          ),
        ),
        body: (allCoursesList == null && getCoursesProvider.isLoading)
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        // width: 328,
                        //height: 156,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search for a teacher',
                          ),
                        ),
                      ),

////////////////box1
                      SizedBox(height: size.height * 0.02),
                      SizedBox(
                          height: 650,
                          child: SizedBox(
                            width: 313,
                            height: 150,
                            child: Container(
                              child: Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 160,
                                      width: 360,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFC8CACC), width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Container(
                                        height: 160,
                                        width: 300,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.0),
                                                ),
                                                Text(
                                                  'Ahmad Ali',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xFF053361),
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120.0, right: 20.0),
                                                ),
                                                Text(
                                                  allCoursesList[index]
                                                      .courseprice,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xFF053361),
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.0),
                                                ),
                                                SizedBox(height: 6.0),
                                                SizedBox(
                                                  width: 125,
                                                  height: 21,
                                                  child: Text(
                                                    allCoursesList[index]
                                                        .coursename,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          color:
                                                              Color(0xFF053361),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16.0),
                                                  ),
                                                  SizedBox(height: 6.0),
                                                  SizedBox(
                                                    width: 125,
                                                    height: 21,
                                                    child: Text(
                                                      "25 hours",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xFF053361),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 230.0),
                                                ),
                                                SizedBox(height: 6.0),
                                                SizedBox(
                                                  width: 65,
                                                  height: 21,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ViewInfo(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "View Info",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xFF0A61B7),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ));
  }
}
