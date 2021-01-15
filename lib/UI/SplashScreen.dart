import 'dart:async';
import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 52, right: 50, left: 40, bottom: 86.96),
                ),
                Text('Tech',
                    style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 38)),
                Text('Learn',
                    style: TextStyle(
                        color: Colors.yellow.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 38)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[

                Image.asset("images/logo1.jpg"),
                Padding(
                  padding: EdgeInsets.only(
                      top: 86.96, right: 80, left: 80, bottom: 98),
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding:
                  EdgeInsets.only(top: 7, right: 164, left: 164, bottom: 7),
                ),
                Text(
                  "Start",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      color: Colors.indigo),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(top: 7, right: 164, left: 164, bottom: 7),
                ),
              ],
            ),
          ),


        ]
    )
    )
        )
    );
  }
}
