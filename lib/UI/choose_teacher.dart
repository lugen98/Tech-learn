import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/view_info.dart';
import 'package:techlearning_app/entities/getCourseByCourseIdModel.dart';
import 'package:techlearning_app/services/get_course_by_course_id_provider.dart';

class ChooseTeacher extends StatefulWidget {
  @override
  _ChooseTeacherState createState() => _ChooseTeacherState();
}

class _ChooseTeacherState extends State<ChooseTeacher> {
  GetCoursebyCourseIdProvider getCoursesByIdProvider =
      GetCoursebyCourseIdProvider();
  GetCoursebyCourseId allCoursesByIdList;
  Size size;

  @override
  void initState() {
    super.initState();
    getCoursesById();
  }

  getCoursesById() async {
    var result = await getCoursesByIdProvider.getAllCoursesByCourseId(1);
    setState(() {
      allCoursesByIdList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //APP Bar
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: //ListView.builder(
           //  itemBuilder: (context, index) {
            //return
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("chose your teacher",
             // allCoursesByIdList.coursegrade+allCoursesByIdList.coursesubject,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.w500,
                      fontSize: 16))),
               ]),
       //  },
        // ),
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
      body: (allCoursesByIdList == null && getCoursesByIdProvider.isLoading)
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: size.height * 0.02),
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
                      height: 600,
                      child: Container(
                        child: Expanded(
                          child:
                              ListView.builder(itemBuilder: (context, index) {
                            return Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 170,
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
                                        "ahmad",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                          color: Color(0xff053361),
                                        )),
                                      ),

                                      //   child:ListTile(),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              allCoursesByIdList.coursegrade +
                                                  allCoursesByIdList.coursesubject+"     "+allCoursesByIdList.courseprice,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff053361),
                                              ),
                                            ),
                                          ),
                                      /*    Container(
                                            height: 160,
                                            width: 300,
                                            child: ListTile(
                                              title: Text(
                                                allCoursesByIdList.courseprice,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0,
                                                      color: Color(0xff053361),
                                                    )),
                                              ),
                                          )),*/


                                          InkWell(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  'View info',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff053361),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewInfo(),
                                                  ),
                                                );
                                              }),
                                          Padding(padding: EdgeInsets.only(bottom: 90),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                          }),
                        ),
                      ))
                ],

/////////////////////////////////
              ),
            ),
    );
  }
}
