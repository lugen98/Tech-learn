import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/student_dashboard.dart';

class ThirdGrade extends StatefulWidget {
  @override
  _ThirdGradeState createState() => _ThirdGradeState();
}

class _ThirdGradeState extends State<ThirdGrade> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text('Third Grade',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w600,
                        fontSize: 20))),
            Padding(padding: EdgeInsets.only(right: 30, left: 30,top: 10)),

          ],
        ),
        leading: Container(
          child: IconButton(
            color: Color(0xFF053361),
            iconSize: 27,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StudentDashboardScreen()));
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

        child: ListView(
            primary: false,
            children: <Widget>[
              SizedBox(height: size.height * 0.04),

              Container(
                height: MediaQuery.of(context).size.height - 127,
                child: ListView(children: <Widget>[
                  InkWell(
                    child: _bulidlevelItem("Maths "),
                    onTap: () {},
                  ),
                  InkWell(
                    child: _bulidlevelItem("Science "),
                    onTap: () {},
                  ),
                  InkWell(
                    child: _bulidlevelItem("Islamic Education"),
                    onTap: () {},
                  ),
                  InkWell(
                    child: _bulidlevelItem("Arabic"),
                    onTap: () {},
                  ),
                  InkWell( child: _bulidlevelItem("English"),
                    onTap: () {},),
                  InkWell( child: _bulidlevelItem("National Education"),
                    onTap: () {},),
                ]),
              )]),
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
                    Text(
                        levelName,
                        style:  GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w500,
                                fontSize: 20))),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            color: Color(0xFF053361),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}