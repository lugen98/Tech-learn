import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/login&signin/TeacherSignIn.dart';
import 'package:techlearning_app/services/auth.dart';
import 'StudentSignIn.dart';

class TeacherRestPass extends StatefulWidget {
  @override
  _TeacherRestPassState createState() => _TeacherRestPassState();
}

class _TeacherRestPassState extends State<TeacherRestPass> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool isHidePassword = false;
  bool isshowPassword = false;

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
                padding: EdgeInsets.only(right: 30, left: 20),
              ),
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
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.only(top: 65, right: 50, left: 60, bottom: 10),
                        ),
                        Text('Reset Password',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.only(top: 17, right: 10, left: 16, bottom: 10),
                        ),
                        Text('Please enter your new password.',
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
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              color: isHidePassword ? Color(
                                                  0xFF0A61B7) : Colors.grey,
                                            ),
                                            onPressed: () {
                                              _togglePasswordVisability();
                                            },
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(width: 1),
                                          ),
                                          hintText: "New password",
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC8CACC),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(10))),
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
                                      validator: (val) =>
                                      val.compareTo(password) != null
                                          ? "Password does not match"
                                          : null,
                                      obscureText: !isshowPassword,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: isshowPassword ? Color(
                                                0xFF0A61B7) : Colors.grey,
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 2, left: 2, bottom: 10),
                                ),
                                SizedBox(
                                    width: 328,
                                    height: 49,
                                    child: RaisedButton(
                                      color: Color(0xFFFFD900),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      child: Text(
                                        "Reset password",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF053361),
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          dynamic result = await _auth.signInEP(
                                              password, confirmPass);
                                          if (result == null) {
                                            setState(() => error = 'Failed To Sign In');
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    TeacherSignIn()));
                                          }
                                        }
                                      },
                                    )),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, right: 2, left: 2, bottom: 10),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => TeacherSignIn()));
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
                              ]))))
                ]))));
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
