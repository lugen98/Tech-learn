import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/teacherReg.dart';
import '../dashboardTest.dart';
import '../homeScreen.dart';
import 'Settings.dart';
import 'editProfile.dart';
import 'profile.dart';
import 'package:techlearning_app/services/auth.dart';


class Mydrawer  extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer > {

String error="";
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Lugain Fareed",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          accountEmail: Text("lugen@gmail.com",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person),
            backgroundColor: Color(0xff453658),
          ),

        ),

        ListTile(
            title: Text("Main page",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Dashboard()));
            }
        ),
        ListTile(
            title: Text("Register",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.person_add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherReg()));
            }
        ),
        ListTile(
            title: Text("Profile",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
        ),
        ListTile(
          title: Text("Settings",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)
          ),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        ),

        ListTile(
            title: Text("Edit profile",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            }),


        ListTile(
            title: Text("About",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.info),
            onTap: () {}

        ),
        ListTile(
            title: Text("Fingerprint",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.fingerprint),
            onTap: () {}
        ),
        ListTile(
            title: Text("Logout",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.exit_to_app),
            onTap:(){
              openSignOutPage();
            }

            ),


      ]
      ),
    );
  }

 void openSignOutPage() async {

   await _auth.signOut();
     Navigator.push(context,
         MaterialPageRoute(builder: (context) => MainHomePage()));

 }
}