import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/UI/homeScreen.dart';

import 'firstSignIn.dart';

class TeacherSignIn extends StatefulWidget {
  final Function toggleView;
  TeacherSignIn({this.toggleView});

  @override
  _TeacherSignInState createState() => _TeacherSignInState();
}

class _TeacherSignInState extends State<TeacherSignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
                  style: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Text('Learn',
                  style: TextStyle(
                      color: Color(0xFFFFD900),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            width: 40,
            height: 60,
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 28,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>FirstSignIn()));
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
                Padding(
                  padding: EdgeInsets.only(top: 7, right: 23, left: 23, bottom: 2),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 65, right: 23, left: 20, bottom: 20),
                      ),
                      Text('Sign in to your TechLearn Account',
                          style: TextStyle(
                              color: Color(0xFF053361),
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 10),
                    ),
                    SizedBox(
                      width: 328,
                      height: 49,
                      child: SignInButton(
                          buttonType: ButtonType.google,
                          onPressed: () async {
                            await _auth.signInGoogle();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          }
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 10),
                    ),
                    SizedBox(
                      width: 328,
                      height: 49,
                      child: SignInButton(
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 40.0,
                              ),
                              TextFormField(
                                validator: (val) =>
                                val.isEmpty ? 'Enter email' : null,
                                decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  icon: Icon(Icons.email),
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  validator: (val) => val.length < 6
                                      ? 'password Should be more than 6'
                                      : null,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    icon: Icon(Icons.lock),
                                  ),
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 19, right: 1, left: 5, bottom: 30),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text('Remember Me?',
                                          style: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 30, left: 1, bottom: 10),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text('Forgot Password?',
                                          style: TextStyle(
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, right: 2, left: 2, bottom: 10),
                                  ),
                                  SizedBox(
                                    width: 700,
                                    height: 49,
                                    child: RaisedButton(
                                      color: Color(0xFFFFD900),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF053361),
                                            fontWeight: FontWeight.w700),
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
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                error,
                                style: TextStyle(color: Colors.red, fontSize: 14.0),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Dont have an account?',
                                      style: TextStyle(
                                          color: Color(0xFF053361),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => TeacherSignIn()));
                                        },
                                        child: Text(
                                          "Click here to Sign up ",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF0A61B7),
                                              fontWeight: FontWeight.w700),
                                        ))
                                  ],
                                ),
                              )
                            ]))))
              ])),
        ));
  }
}
