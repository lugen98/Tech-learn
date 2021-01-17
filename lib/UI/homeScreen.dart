import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/UI/firstsignup.dart';
import 'package:techlearning_app/services/SingIn_auth.dart';
import 'package:techlearning_app/services/register.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 75, right: 50, left: 40, bottom: 80),
                ),
                Text('Tech',
                    style: TextStyle(
                        color: Color(0xFF053361),
                        fontWeight: FontWeight.bold,
                        fontSize: 38)),
                Text('Learn',
                    style: TextStyle(
                        color: Color(0xFFFFD900),
                        fontWeight: FontWeight.bold,
                        fontSize: 38)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
    SvgPicture.asset("images/Frame 1.svg"),
                Padding(
                  padding: EdgeInsets.only(
                      top: 86.96, right: 80, left: 80, bottom: 10),
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: 1, right: 21, left: 31, bottom: 10),
              ),
              SizedBox(
                width: 328,
                height: 49,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>FirstSignUp()));
                    },
                    color: Color(0xFFFFD900),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: openRegPage,
                      child: Text(
                        "Create Free Account",
                        style: TextStyle(
                            fontSize: 16,
                            color:  Color(0xFF053361),
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              )
            ]),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 1, right: 21, left: 31, bottom: 50),
                ),
                Text(
                  'Already have an account ?',
                  style: TextStyle(
                      color:  Color(0xFF053361),
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      " Click here to log in ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF0A61B7),
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          )
        ]))));
  }

  void openRegPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstSignUp()));
  }
}
