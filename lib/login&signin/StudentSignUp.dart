import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/login&signin/StudentSignIn.dart';
import 'package:techlearning_app/services/auth.dart';
import 'firstsignup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'orDivider.dart';

class StudentSignUp extends StatefulWidget {


  @override
  _StudentSignUpState createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isHidePassword = false;
  bool isshowPassword = false;


  //text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPass = "";

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
                            top: 65, right: 40, left: 40, bottom: 6),
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
                                        "Sign up with google",
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
                                        "Sign up with Facebook",
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
                                  val.isEmpty ? 'Enter First Name' : null,
                                  decoration: InputDecoration(
                                      hintText: 'First name',
                                      labelText: 'First name',
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (val) {
                                    setState(() => firstName = val);
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
                                  val.isEmpty ? 'Enter Last Name' : null,
                                  decoration: InputDecoration(
                                      hintText: 'last name',
                                      labelText: 'last name',
                                      prefixIcon: Icon(Icons.people),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10))),
                                  onChanged: (val) {
                                    setState(() => lastName = val);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 2, left: 2, bottom: 15),
                              ),
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
                                        hintText: "password 6+ characters",
                                        labelText: "password",
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
                                    top: 10, right: 2, left: 2, bottom: 10),
                              ),
                              SizedBox(
                                height: 49,
                                width: 328,
                                child: TextFormField(
                                    validator: (val) => val.length < 6
                                        ? 'password Should be more than 6'
                                        : null,
                                    /*validator: (val) =>
                                    val.compareTo(password) != null
                                        ? "Password does not match"
                                        : null,*/
                                    obscureText: !isshowPassword,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: isshowPassword
                                              ? Color(0xFF0A61B7)
                                              : Colors.grey,
                                        ),
                                        onPressed: () {
                                          _togglePassVisability();
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(width: 1),
                                      ),
                                      hintText: "Confirm password",
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC8CACC),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                    onChanged: (val) {
                                      setState(() => confirmPass = val);
                                    }),
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
                                          top: 5, right: 10, left: 3, bottom: 10),
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
                                        "Sign Up",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF053361),
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          dynamic result =
                                          await _auth.registerEP(email, password);
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
                                  )

                                ]
                                ),


                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, right: 16, left: 20, bottom: 5),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 10, left: 17, bottom:30),
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
                                                      StudentSignIn()));
                                        },
                                        child: Text(
                                          "Click here to Sign in ",
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

  void _togglePassVisability() {
    setState(() {
      isshowPassword = !isshowPassword;
    });
  }
}
