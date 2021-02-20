import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/menu/email.dart';
import 'package:techlearning_app/menu/password.dart';

import 'phone.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xFF053361),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF053361),
          ),
        ),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
              trailing: new Icon(
                Icons.arrow_forward,
                color: Color(0xFF053361),
              ),
              title: new Text(
                "Change email",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Email()),
                );
              }),
          new ListTile(
              trailing: new Icon(
                Icons.arrow_forward,
                color: Color(0xFF053361),
              ),
              title: new Text(
                "Change password",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Password()),
                );
              }),
        ],
      ),
    );
  }
}


