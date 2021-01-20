import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/auth.dart';
import 'StudentForgetPass.dart';
import 'firstSignIn.dart';
import 'StudentSignUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'orDivider.dart';
class StudentSignIn extends StatefulWidget {
  final Function toggleView;
  StudentSignIn({this.toggleView});

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
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 65, right: 10, left: 13, bottom: 5),
                  ),
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
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
            Padding(
              padding: EdgeInsets.only(top: 5, right: 2, left: 2, bottom: 5),
            ),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                          top: 7.0, bottom: 7.0, right: 40.0, left: 10.0),
                      onPressed: () {},
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            'images/facebook 1.svg',
                            height: 20.0,
                            width: 20.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 20, left: 50.0),
                              child: Text(
                                "Sign in with Facebook",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFF053361),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500)),
                              ))
                        ],
                      ),
                    ),
                  ),
                ])),

              Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 70, left: 70, bottom: 10),
              ),
    OrDivider(),
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
                                  val.isEmpty ? 'Enter email' : null,
                              decoration: InputDecoration(
                                  hintText: 'E-mail',
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, right: 2, left: 2, bottom: 10),
                          ),
                          SizedBox(
                            width: 328,
                            height: 49,
                            child: TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'password Should be more than 6'
                                    : null,
                                obscureText: !isHidePassword,
                                decoration: InputDecoration(
                                    hintText: "Enter password",
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        color: isHidePassword
                                            ? Color(0xFF0A61B7)
                                            : Colors.grey,
                                      ),
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, right: 2, left: 2, bottom: 5),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 5, left: 5, bottom: 5),
                                ),
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
                                  padding: EdgeInsets.only(
                                      top: 20, right: 20, left: 20, bottom: 10),
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
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, right: 2, left: 2, bottom: 5),
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
                                      dynamic result =
                                          await _auth.signInEP(email, password);
                                      if (result == null) {
                                        setState(
                                            () => error = 'Failed To Sign In');
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dashboard()));
                                      }
                                    }
                                  },
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, right: 16, left: 17, bottom: 5),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, right: 20, left: 17, bottom: 30),
                                ),
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
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
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
