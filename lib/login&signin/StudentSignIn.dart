import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/student_dashboard.dart';
import 'package:techlearning_app/services/auth.dart';
import 'StudentForgetPass.dart';
import 'firstSignIn.dart';
import 'StudentSignUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'orDivider.dart';

class StudentSignIn extends StatefulWidget {


  @override
  _StudentSignInState createState() => _StudentSignInState();
}

class _StudentSignInState extends State<StudentSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool checkBokValue = false;
  bool isHidePassword = false;

  //text filed state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              Padding(padding: EdgeInsets.only(right: 30, left: 30)),
            ],
          ),
          leading: Container(
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 24,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstSignIn()));
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
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  Text('Sign in to your TechLearn Account',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF053361),
                              fontWeight: FontWeight.w700,
                              fontSize: 18))),
                ],
              ),
            ),
            Container(
                child: Column(children: <Widget>[
              SizedBox(height: size.height * 0.04),
              SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF6D747A)),
                      borderRadius: BorderRadius.circular(10.0)),
                  highlightColor: Color(0xFF6D747A),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () async {
                    await _auth.signInGoogle();
                  },
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        'images/search 1.svg',
                        height: 20.0,
                        width: 20.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 40, left: 50.0),
                          child: Text(
                            "Sign in with google",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500)),
                          ))
                    ],
                  ),
                ),
              )
            ])),
            SizedBox(height: size.height * 0.03),
            OrDivider(),
            Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: size.height * 0.01),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter email' : null,
                              decoration: InputDecoration(
                                  labelText: 'Email',
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
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'password Should be more than 6'
                                    : null,
                                obscureText: !isHidePassword,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(isHidePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      color: isHidePassword
                                          ? Color(0xFF0A61B7)
                                          : Colors.grey,
                                      onPressed: () {
                                        _togglePasswordVisability();
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFC8CACC),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onChanged: (val) {
                                  setState(() => password = val);
                                }),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: checkBokValue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkBokValue = value;
                                      });
                                    }),
                                InkWell(
                                  onTap: () {},
                                  child: Text('Remember Me?',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentForgotPass()));
                                  },
                                  child: Text('Forgot Password?',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(children: <Widget>[
                              SizedBox(height: size.height * 0.03),
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
                                      dynamic result = await _auth
                                          .signInStudentEP(email, password);
                                      if (result == null) {
                                        setState(
                                            () => error = 'Failed To Sign In');
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StudentDashboard()));
                                      }
                                    }
                                  },
                                ),
                              ),
                            ]),
                          ),

                          Text(
                            error,
                            style: TextStyle(
                                color: Colors.red, fontSize: 12.0),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: size.height * 0.03),
                                Text(
                                  'Dont have an account?',
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
                                                  StudentSignUp()));
                                    },
                                    child: Text(
                                      "Click here to Sign up ",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w700)),
                                    ))
                              ],
                            ),
                          ),
                        ]))))
          ])),
        ));
  }

  void _togglePasswordVisability() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }
}
