import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  bool isHidePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,

        title:  Text('Change email',
          style: GoogleFonts.poppins(textStyle:TextStyle(
            color:Color(0xFF053361),
            fontWeight:FontWeight.w500  ,
            fontSize: 16 ,

          )
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF053361),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[


          Expanded(
            child: Container(

              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                hintText: 'Current email',
                                hintStyle: GoogleFonts.poppins(textStyle:TextStyle(
                                  fontWeight:FontWeight.w500  ,
                                  fontSize: 15 ,
                                  color:Color(0xFF6D747A),



                                )

                                ),

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20,),


                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),

                              decoration: InputDecoration(
                                hintText: 'Confirm current email',
                                hintStyle: GoogleFonts.poppins(textStyle:TextStyle(
                                  fontWeight:FontWeight.w500  ,
                                  fontSize: 15 ,
                                  color:Color(0xFF6D747A),



                                )

                                ),

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color:Color(0xFFFFD900) ,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: InkWell(
                        child: Center(
                          child: Text("submit",  style: GoogleFonts.poppins(textStyle:TextStyle(
                          fontWeight:FontWeight.w700  ,
                            fontSize: 16 ,
                            color:Color(0xFF053361),


                          )

                        ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(width: 30,),

                      ],
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}