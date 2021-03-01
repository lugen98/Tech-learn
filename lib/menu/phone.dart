import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  bool hidePwd = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change phone number',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          )),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                    getNewNumber(),
                    SizedBox(
                      height: 20,
                    ),
                    getConfirmNumber(),
                    SizedBox(height: size.height * 0.03),
                    getSubmitButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget getNewNumber()
  {
    return  Container(
      padding:
      EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              obscureText: hidePwd,
              decoration: InputDecoration(
                hintText: 'New phone number',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF6D747A),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getConfirmNumber() {
    return  Container(
      padding:
      EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              obscureText: hidePwd,
              decoration: InputDecoration(
                hintText: 'Confirm new phone number',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF6D747A),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
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
                //  Navigator.push(
                //   context, MaterialPageRoute(builder: (context) =>AddCourseTraining()));
              },
            ),
          ),
        ],
      ),
    );
  }

  void togglePwdVisibility() {
    hidePwd = !hidePwd;
    setState(() {});
  }
}
