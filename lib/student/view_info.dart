import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/courses_provider.dart';
import 'package:techlearning_app/services/users_provider.dart';

class ViewInfo extends StatefulWidget {
  final CourseModel courseModel;

  const ViewInfo({Key key, this.courseModel}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ViewInfoState();
  }
}

class ViewInfoState extends State<ViewInfo> {
  CoursesProvider getCoursesProvider = CoursesProvider();
  UsersProvider usersProvider = UsersProvider();
  UserModel userModel = UserModel();
  Size size;

  @override
  void initState() {
    super.initState();
    getTeacherInfo();
  }

  getTeacherInfo() async {
    userModel =
        await usersProvider.getTeacherByTeacherId(widget.courseModel.ownerid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Teacher Information',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w500,
                          fontSize: 16))),
              Padding(padding: EdgeInsets.only(right: 5)),
              Text('',
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
        body: (userModel == null || usersProvider.isLoading)
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : SingleChildScrollView(
                child: Container(
                    child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Teacher Name',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(
                        height: 23,
                        child: Text(
                          widget.courseModel.ownername,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(
                        // width: 79,
                        //height: 23,
                        child: Text(
                          userModel.email,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Phone Number',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /////////////////////////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(
                        // width: 79,
                        //height: 23,
                        child: Text(
                          userModel.phone,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Degree',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(
                        // width: 79,
                        //height: 23,
                        child: Text(
                          userModel.degree,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ////////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Major',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ////////////////////////////////
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(
                        // width: 79,
                        //height: 23,
                        child: Text(
                          userModel.major,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      SizedBox(height: 56.0),
                      SizedBox(
                        // width: 61,
                        //height: 18,
                        child: Text(
                          'Additional details',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFC8CACC),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /////////////////////////////////
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                  ),

                  Container(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Padding(padding:EdgeInsets.only(left: 16.0),),

                        SizedBox(height: 1.0),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: 400,
                            height: 115,
                            child: Text(
                              widget.courseModel.coursedetails,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        // border:Border.all(color: Color(0xFF053361),width: 0),
                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                  ),
                ])),
              ));
  }
}
