import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/CourseModel.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/courses_provider.dart';

class AddCourseTrainingScreen extends StatefulWidget {
  @override
  _AddCourseTrainingScreenState createState() =>
      _AddCourseTrainingScreenState();
}

class _AddCourseTrainingScreenState extends State<AddCourseTrainingScreen> {
  CoursesProvider _coursesProvider = CoursesProvider();
  TextEditingController courseNameController = TextEditingController();
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
        title: Text('Add - Information',
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
      body: _coursesProvider.isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    getAddTrainingCourseWidget(),
                    SizedBox(height: size.height * 0.02),
                    getAddPriceWidget(),
                    SizedBox(height: size.height * 0.02),
                    getAdditionalDetails(),
                    SizedBox(height: 28.0),
                    getSubmitButton(),
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
      newCourseModel.coursetype = 1;
      newCourseModel.ownername =
          currentUser.firstname + ' ' + currentUser.lastname;
      newCourseModel.coursename = courseNameController.text;
      newCourseModel.coursegrade = ' ';
      newCourseModel.gradeid = 0;
      newCourseModel.coursesubject = ' ';
      newCourseModel.subjectid = 0;
      newCourseModel.courseprice = priceFieldController.text.toString();
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

  Widget getSubmitButton() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 328,
            height: 49,
            child: RaisedButton(
              color: Color(0xFFFFD900),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w700)),
              ),
              onPressed: () {
                addCourse();
                //  Navigator.push(
                //   context, MaterialPageRoute(builder: (context) =>AddCourseTraining()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getAdditionalDetails() {
    return SizedBox(
      // width: 328,
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
          border: Border.all(color: Color(0xFF053361), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  Widget getAddTrainingCourseWidget() {
    return SizedBox(
      height: 49,
      width: 328,
      child: TextFormField(
        controller: courseNameController,
        validator: (val) => val.isEmpty ? 'please Enter Course Name' : null,
        decoration: InputDecoration(
            hintText: "Enter Course Name",
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFC8CACC),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Widget getAddPriceWidget() {
    return SizedBox(
      height: 49,
      width: 328,
      child: TextFormField(
        controller: priceFieldController,
        validator: (val) => val.isEmpty ? 'please Enter Course Price' : null,
        decoration: InputDecoration(
            hintText: "Course price - per hour",
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFC8CACC),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
