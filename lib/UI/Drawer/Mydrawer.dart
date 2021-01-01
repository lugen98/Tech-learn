import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dashboardTest.dart';
import '../homeScreen.dart';
import 'Settings.dart';
import 'editProfile.dart';
import 'profile.dart';


class Mydrawer extends StatelessWidget {
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainHomePage()));
            }),


      ]
      ),
    );
  }


}