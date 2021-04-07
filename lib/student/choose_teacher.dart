import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/SubjectsModel.dart';
import 'package:techlearning_app/services/courses_provider.dart';
import 'package:techlearning_app/student/view_info.dart';

class ChooseTeacher extends StatefulWidget {
  final SubjectsModel subjectsModel;

  const ChooseTeacher({Key key, this.subjectsModel}) : super(key: key);
  @override
  _ChooseTeacherState createState() => _ChooseTeacherState();
}

class _ChooseTeacherState extends State<ChooseTeacher> {
  CoursesProvider coursesProvider = CoursesProvider();
  List<CourseModel> courseModelList;
  Size size;

  @override
  void initState() {
    super.initState();
    getCoursesByGradeAndSubject(
        widget.subjectsModel.gradeid, widget.subjectsModel.id);
  }

  getCoursesByGradeAndSubject(int grade, int subject) async {
    var result =
        await coursesProvider.getCoursesByGradeAndSubject(grade, subject);
    setState(() {
      courseModelList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    //APP Bar
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Choose Your Teacher",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.w500,
                      fontSize: 16))),
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
        body: (courseModelList == null || coursesProvider.isLoading)
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            // SizedBox(height: size.height * 0.01),
                            SizedBox(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search for a teacher',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /////////////////////////box1

                      SizedBox(
                          height: 650,
                          child: Container(
                            child: ListView.builder(
                                itemCount: courseModelList.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 160,
                                        width: 360,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2,
                                            )),
                                        child: ListTile(
                                          title: Text(
                                            courseModelList[index].ownername,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Color(0xff053361),
                                            )),
                                          ),

                                          //   child:ListTile(),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      courseModelList[index]
                                                              .coursegrade +
                                                          "\n" +
                                                          courseModelList[index]
                                                              .coursesubject,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff053361),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Price: ',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff053361),
                                                          ),
                                                        ),
                                                        Text(
                                                          courseModelList[index]
                                                              .courseprice,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff053361),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Text(
                                                      'View info',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff053361),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewInfo(
                                                                courseModel:
                                                                    courseModelList[
                                                                        index]),
                                                      ),
                                                    );
                                                  }),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 90),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }),
                          ))
                    ],
                  ),
                ),
              ));
  }
}
