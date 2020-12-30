import 'package:flutter/material.dart';
import 'DashboardPage.dart';
import 'Drawer/Mydrawer.dart';


class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Tech Learn',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontSize: 24.0, color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white54,
            )
          ],
        ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Padding(padding:EdgeInsets.only(left: 16, top: 10,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome To TechLearn",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
                  SizedBox(height: 4,),
                  Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),




                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Image.asset('images/notification.png',width: 30,),
                onPressed: (){
                 // Navigator.push(context,
                    //  MaterialPageRoute(builder: (context) => Notifications()));
                },
              )
            ],
          ),
          ),

          SizedBox(height: 40,
          ),
          GridDashboard(),


        ],
      ),
        drawer: Mydrawer(),
    );
  }
  }