import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/login&signin/StudentRestPass.dart';
import 'StudentSignIn.dart';

class StudentForgotPass extends StatefulWidget {
  @override
  _StudentForgotPassState createState() => _StudentForgotPassState();
}

class _StudentForgotPassState extends State<StudentForgotPass> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tech',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              Text('Learn',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFFFFD900),
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              Padding(padding: EdgeInsets.only(right: 30,left: 30) ),
            ],
          ),
          leading: Container(
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentSignIn()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF053361),
              ),
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
              Container(
              child: Column(children: <Widget>[
              Container(
              child:Column(
              children: <Widget>[
              SizedBox(height: size.height * 0.05),
                Text('Forgot Your Password?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF053361),
                            fontWeight: FontWeight.w700,
                            fontSize: 18))),
              ],
            ),
          ),
                SizedBox(height: size.height * 0.02),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                Text('Enter your Email and we will send you a reset link',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF053361),
                            fontWeight: FontWeight.w500,
                            fontSize: 13))),
              ],
            ),
          ),
          Container(
              child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        SizedBox(height: size.height * 0.03),
                        SizedBox(
                          width: 328,
                          height: 49,
                          child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter email' : null,
                            decoration: InputDecoration(
                                hintText: 'E-mail',
                                labelText: 'E-mail',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFC8CACC),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                      ])))),
          Container(
              child: Column(children: <Widget>[
                SizedBox(height: size.height * 0.03),
            SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                  color: Color(0xFFFFD900),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Send Reset Link",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF053361),
                            fontWeight: FontWeight.w700)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentRestPass()));
                  },
                )),
                SizedBox(height: size.height * 0.03),

                InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StudentSignIn()));
              },
              child: Text(
                "Back to Sign In",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF0A61B7),
                        fontWeight: FontWeight.w500)),
              ),
            )
          ])),
        ]))
    ])))
    );
  }


}
