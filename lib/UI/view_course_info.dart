import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/view_info.dart';

class ViewCourseInfo extends StatelessWidget {
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
            onPressed: () {Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF053361),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.04),

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
            SizedBox(height: 57.0),
            SizedBox(
              width: 313,
              height: 134,
              child:Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding:EdgeInsets.only(left: 16.0),),

                        Text('Ahmad Ali',
                          //textAlign:TextAlign.left ,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),),
                        ),
                        Padding(padding:EdgeInsets.only(left: 120.0,right: 20.0),),
                        Text("JOD 20",
                          // textAlign:TextAlign.left ,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF053361),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),

                      ],
                    ),

                    ////////////////////////////////////////////////////////

                    Row(
                      children: <Widget>[
                        Padding(padding:EdgeInsets.only(left: 16.0),),

                        SizedBox(height: 6.0),
                        SizedBox(
                          width: 125,
                          height: 21,
                          child:
                          Text("photoshop",
                            // textAlign:TextAlign.left ,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF053361),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                        ),

                      ],
                    ),
                    //////////////////////
                  /*  Row(
                      children: <Widget>[
                        Padding(padding:EdgeInsets.only(left: 16.0),),

                        SizedBox(height: 6.0),
                        SizedBox(
                          width: 125,
                          height: 21,
                          child:
                          Text("Course Training",
                            // textAlign:TextAlign.left ,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF053361),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                        ),

                      ],
                    ),*/
////////////////////////////////////////////////
                    Container(
                      child:Row(
                        children: <Widget>[
                          Padding(padding:EdgeInsets.only(left: 16.0),),

                          SizedBox(height: 6.0),
                          SizedBox(
                            width: 125,
                            height: 21,
                            child:
                            Text("25 hours",
                              // textAlign:TextAlign.left ,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

//////////////////////////////////////////////
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Padding(padding:EdgeInsets.only(bottom: 79.0)),

                        Padding(padding:EdgeInsets.only(right: 230.0),),
                        SizedBox(height: 6.0),
                        SizedBox(
                          width: 65,
                          height: 21,
                          child:
                          InkWell(

                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>ViewInfo(),
                                ),
                              );
                            },
                            child:Text("View Info",
                              // textAlign:TextAlign.left ,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF0A61B7),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),

                      ],

                    )


                  ],
                ),
                decoration: BoxDecoration(
                  border:Border.all(color: Color(0xFFC8CACC),width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),

              ),
            ),
//////////////////////////////////////////////////////////////////
            //Box2
            //
//////////////////////////////////////////////////////////////////////////////////
            //box3
          /* Column(
              children: <Widget>[

                SizedBox(height: 40.0),
                SizedBox(
                  width: 313,
                  height: 134,
                  child:Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 16.0),),

                            Text('Ahmad Ali',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(padding:EdgeInsets.only(left: 120.0,right: 20.0),),

                            Text("JOD 20",
                              // textAlign:TextAlign.left ,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(

                                    color: Color(0xFF053361),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),

                            ),

                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 16.0),),

                            SizedBox(height: 6.0),
                            SizedBox(
                              width: 125,
                              height: 21,
                              child:
                              Text("Maths-First grade",
                                // textAlign:TextAlign.left ,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF053361),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),

                          ],
                        ),
                        ///////////////////////
                        Row(
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 16.0),),

                            SizedBox(height: 6.0),
                            SizedBox(
                              width: 125,
                              height: 21,
                              child:
                              Text("Course Training",
                                // textAlign:TextAlign.left ,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF053361),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),

                          ],
                        ),


/////////////////////////////////////////////////
                        Row(
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 16.0),),

                            SizedBox(height: 6.0),
                            SizedBox(
                              width: 125,
                              height: 21,
                              child:
                              Text("25 hours",
                                // textAlign:TextAlign.left ,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF053361),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),

                          ],
                        ),
                        /////////////////////////

                        Row(

                          children: <Widget>[
                            //Padding(padding:EdgeInsets.only(bottom: 79.0)),

                            Padding(padding:EdgeInsets.only(right: 230.0),),

                            SizedBox(height: 6.0),
                            SizedBox(
                              width: 65,
                              height: 21,
                              child:
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>ViewInfo(),
                                    ),
                                  );
                                },
                                child:Text("View Info",
                                  // textAlign:TextAlign.left ,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFF0A61B7),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),




                      ],
                    ),
                    decoration: BoxDecoration(
                      border:Border.all(color: Color(0xFFC8CACC),width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),


              ],

            ),*/













/////////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),

      ),











    );
  }
}
