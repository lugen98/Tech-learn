import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techlearning_app/menu/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "welcome",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      //Now we are going to open a new file
      // where we will create the layout of the Drawer
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset("images/frame1.jpg"),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Heyam Zyoud",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0A61B7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
        },
        leading: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.feedback,
          color: Colors.black,
        ),
        title: Text(
          "About",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.language,
          color: Colors.black,
        ),
        title: Text(
          "العربية",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          )),
        ),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.black,
        ),
        title: Text(
          "Sign out",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Color(0xFF053361),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          )),
        ),
      ),
    ]);
  }
}
