import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/Login.dart';
import 'singUpTest.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();

}
class _MainHomePageState extends State<MainHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/6.JPG',
              fit: BoxFit.fill),
          Padding(padding: EdgeInsets.all(40.0),),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Login()));
            },
             child: Container(
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff453658),Color(0xff453658)],
                  stops: [0,1],
                ),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(
              child: Text("LogIn",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),),
            ),
          )

    ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => SignUp()));
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff453658),Color(0xff453658)],
                    stops: [0,1],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Center(
                child: Text("Sing Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24
                  ),),
              ),
            )

          )
        ],
      ),


    );
  }


}


