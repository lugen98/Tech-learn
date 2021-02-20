import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditInformation extends StatelessWidget {
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
              Text('Edit Information',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w600,
                          fontSize: 20))),
              Padding(padding: EdgeInsets.only(right: 30, left: 30)),
            ],
          ),
          leading: Container(
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {  Navigator.pop(context);},
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF053361),
              ),
            ),
          ),
        ),
        /////////////////////////////////////////////////////
        //TextFeild
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  keyboardType:  TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '20',
                    prefixIcon: Image.asset(
                      'images/Vector (1).png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),

                //////////////////////////////////////////
                //BoxDecoration

                SizedBox(height: 30.0),
                SizedBox(
                  width: 400,
                  height: 159,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF6D747A),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF053361), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
                ///////////////////////////////////////

                SizedBox(height: 28.0),
                SizedBox(
                  width: 328,
                  height: 49,
                  child: RaisedButton(
                    color: Color(0xFFFFD900),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),

                    onPressed: () {},
                    //////////////////////////////////
                    //save Button
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF053361),
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),

                FlatButton(
                  // padding:EdgeInsets.all(2.5),

                  onPressed: () {
                    final AlertDialog alert = AlertDialog(
                      title: Text('Delete Lecture'),
                      content: Container(
                        width: 310,
                        height: 185,
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.black,
                            ),
                            Text(
                              "By deleting this lecture , it will no longer remain in your students pages, are you sure you want to delete it ? ",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFF053361),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            ////////////////////////////////////
                            //Delete Button in Dialog
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
                                Text(
                                  "Cancel",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFC8CACC),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 5.0, right: 5.0),
                                ),
                                ////////////////////////////////
                                //Cancel Button in Dialog
                                Text(
                                  "Delete",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFFE20000),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    showDialog(context: context, child: alert);
                  },

                  child: Text(
                    "Delete",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFE20000),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
