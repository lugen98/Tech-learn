import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/login&signin/TeacherSignIn.dart';
import 'package:techlearning_app/services/auth.dart';
import 'firstsignup.dart';


class TeacherSign2 extends StatefulWidget {

  @override
  _TeacherSign2State createState() => _TeacherSign2State();
}

class _TeacherSign2State extends State<TeacherSign2> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isHidePassword = false;
  bool isshowPassword = false;
  //text filed state
  String email = '';
  String password = '';
  String Degree = '';
  String Major = '';
  String phoneNumber = "";

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40, left: 20),
              ),
              Text('Tech',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w600,
                          fontSize: 20))),
              Text('Learn',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFFFFD900),
                          fontWeight: FontWeight.w600,
                          fontSize: 20))),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            width: 40,
            height: 60,
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 26,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstSignUp()));
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
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 65, right: 40, left: 40, bottom: 5),
                      ),
                      Text('Sign up For TechLearn',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF053361),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18))),
                    ],
                  ),
                ),
                  Container(
                    child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 2, left: 2, bottom: 5),
                              ),
                              SizedBox(
                                width: 328,
                                height: 49,
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter your Degree' : null,
                                  decoration: InputDecoration(
                                      hintText: 'Degree',
                                      labelText: 'Degree',
                                      prefixIcon:  Image.asset(
                                          'images/Degree Icon.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (val) {
                                    setState(() => Degree = val);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 2, left: 2, bottom: 5),
                              ),
                              SizedBox(
                                width: 328,
                                height: 49,
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter your Major' : null,
                                  decoration: InputDecoration(
                                      hintText: 'Major',
                                      labelText: 'Major',
                                      prefixIcon: Icon(Icons.bookmark),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (val) {
                                    setState(() => Major = val);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, right: 2, left: 2, bottom: 10),
                              ),
                              SizedBox(
                                width: 328,
                                height: 49,
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'Enter your phone Number ' : null,
                                  decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      labelText: 'Phone Number',
                                      prefixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (val) {
                                    setState(() => phoneNumber = val);
                                  },
                                ),
                              ),

                              Container(
                                  child: Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 19, right: 10, left: 3, bottom: 10),
                                    ),
                                    Text('By signing up, you agree to our',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Color(0xFF6D747A),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12))),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 1, left: 3, bottom: 10),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text('Terms and ',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xFF0A61B7),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12))),
                                    )
                                  ])),
                              Container(
                                  child: Row(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 10, left: 3, bottom: 15),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text('Privacy Policy',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xFF0A61B7),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12))),
                                    )
                                  ])),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 10, left: 5, bottom: 5),
                              ),
                              Container(
                                child: Row(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, right: 10, left: 5, bottom: 15),
                                  ),
                                  SizedBox(
                                    width: 328,
                                    height: 49,
                                    child: RaisedButton(
                                        color: Color(0xFFFFD900),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          "Sign in",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF053361),
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState.validate()) {
                                            dynamic result = await _auth.registerEP(
                                                email, password);
                                            if (result == null) {
                                              setState(() =>
                                              error = 'Failed To Sign In');
                                            } else if (_formKey.currentState
                                                .validate()) {
                                              dynamic result = await _auth
                                                  .registerEP(email, password);
                                              if (result == email) {
                                                setState(() => error =
                                                'The email address is already in use by another account');
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Dashboard()));
                                              }
                                            }
                                          }
                                        }),
                                  ),
                                ]),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 10, left: 20, bottom: 5),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 10, left: 20, bottom: 30),
                                    ),
                                    Text(
                                      'Already have an account?',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF053361),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeacherSignIn()));
                                        },
                                        child: Text(
                                          "Click here to Sign In ",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF0A61B7),
                                                  fontWeight: FontWeight.w700)),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 328,
                                height: 49,
                             child:
                              Text(
                                error,
                                style: TextStyle(color: Colors.red, fontSize: 14.0),
                              ),),
                            ]))))
              ])),
        ));
  }
}
