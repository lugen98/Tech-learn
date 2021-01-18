import 'package:flutter/material.dart';
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
                      EdgeInsets.only(top: 65, right: 50, left: 30, bottom: 10),
                ),
                Text('Forgot Your Password?',
                    style: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 17, right: 16, left: 16, bottom: 10),
                ),
                Text('Enter your Email and we will send you a reset link',
                    style: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w500,
                        fontSize: 13)),
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
            Padding(
              padding: EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 5),
            ),
            SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                  color: Color(0xFFFFD900),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Send Reset Link",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                ))
          ])),

        ])))

    );
  }
}
