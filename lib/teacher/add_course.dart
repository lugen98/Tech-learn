import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/SubjectsModel.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/courses_provider.dart';

class AddCourseScreen extends StatefulWidget {
  final SubjectsModel subjectsModel;
  final String gradeName;

  const AddCourseScreen({Key key, this.subjectsModel, this.gradeName})
      : super(key: key);
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  CoursesProvider _coursesProvider = CoursesProvider();
  TextEditingController priceFieldController = TextEditingController();
  TextEditingController detailsFieldController = TextEditingController();
  UserModel currentUser = UserModel();
  @override
  void initState() {
    super.initState();
    getUser();
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
            Text('Add -',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w500,
                        fontSize: 16))),
            Padding(padding: EdgeInsets.only(right: 5)),
            Text('Information',
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
      body: _coursesProvider.isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      child: TextFormField(
                        controller: priceFieldController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.monetization_on),
                          hintText: 'Course price - per hour',
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(
                      width: 328,
                      height: 159,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.chat,
                                  textDirection: TextDirection.ltr,
                                ),
                                onPressed: () {},
                              ),
                              Expanded(
                                  child: TextFormField(
                                controller: detailsFieldController,
                                decoration: const InputDecoration(
                                  hintText: 'Additional details',
                                ),
                              )),
                            ]),
                          ],
                        ),

                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF053361), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        //alignment: Alignment.center ,
                        // padding:EdgeInsets.all(16.0),
                      ),
                    ),
                    SizedBox(height: 28.0),
                    SizedBox(
                      width: 328,
                      height: 49,
                      child: RaisedButton(
                        color: Color(0xFFFFD900),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),

                        onPressed: () {
                          addCourse();
                        },
                        //////////////////////////////////
                        //save Button
                        child: Text(
                          "Submit",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF053361),
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  addCourse() async {
    // this.id,
    // this.ownerid,
    // this.ownername,
    // this.coursetype,
    // this.coursename,
    // this.coursegrade,
    // this.gradeid,
    // this.coursesubject,
    // this.subjectid,
    // this.courseprice,
    // this.coursedetails,
    if (priceFieldController.text.isEmpty ||
        detailsFieldController.text.isEmpty) {
    } else {
      setState(() {
        _coursesProvider.isLoading = true;
      });
      CourseModel newCourseModel = CourseModel();
      newCourseModel.ownerid = currentUser.id;
      newCourseModel.coursetype = 0;
      newCourseModel.ownername =
          currentUser.firstname + ' ' + currentUser.lastname;
      newCourseModel.coursename = '';
      newCourseModel.coursegrade = widget.gradeName;
      newCourseModel.gradeid = widget.subjectsModel.gradeid;
      newCourseModel.coursesubject = widget.subjectsModel.subjectname;
      newCourseModel.subjectid = widget.subjectsModel.gradeid;
      newCourseModel.courseprice = priceFieldController.text.toLowerCase();
      newCourseModel.coursedetails = detailsFieldController.text.toString();
      String result = await _coursesProvider.addCourse(newCourseModel);
      Navigator.pop(context);
      setState(() {});
    }
  }

  void getUser() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userString = pref.getString('userData');
      Map json = jsonDecode(userString);
      currentUser = UserModel.fromJson(json);
    } catch (e) {}
  }
}
