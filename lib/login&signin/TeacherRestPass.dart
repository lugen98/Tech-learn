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
                        Text('Reset Password',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF053361),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                      ],
                    ),
                  ),
                SizedBox(height: size.height * 0.02),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

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
                              child:  Column(children: <Widget>[
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
                                SizedBox(height: size.height * 0.03),

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
                                          icon:  Icon(isshowPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          color: isshowPassword
                                              ? Color(0xFF0A61B7)
                                              : Colors.grey,
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
                                SizedBox(height: size.height * 0.03),

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
                                          dynamic result = await _auth.signInTeacherEP(
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
                                       SizedBox(height: size.height * 0.03),

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
                                ),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                                ),

                              ]))))
                ]))
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