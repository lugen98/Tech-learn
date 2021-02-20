import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCourse extends StatelessWidget {
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
            Text('First Grade  -',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w500,
                        fontSize: 16))),
            Padding(padding: EdgeInsets.only(right: 5)),
            Text('Maths',
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
             SizedBox(height: size.height * 0.02),
            SizedBox(
              child: TextFormField(
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
              child:Container(
                child: Column(

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.chat,textDirection: TextDirection.ltr,), onPressed: () {  },
                        ),

              Expanded(
                child:
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Additional details',


                          ),
                  )
                        ),

               ]),


                  ],
                ),


                decoration: BoxDecoration(
                  border:Border.all(color: Color(0xFF053361),width: 1),
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(10))),

                onPressed: () {},
                //////////////////////////////////
                //save Button
                child: Text(
                  "Submitt",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w700

                      )
                  ),
                ),

              ),
            ),
          ],
        ),
      ),











    );
  }
}
