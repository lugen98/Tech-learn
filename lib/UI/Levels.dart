import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:techlearning_app/UI/Classes.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/UI/dashboardTest.dart';
import 'package:techlearning_app/UI/Drawer/Mydrawer.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'level ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LevelPage(title: 'Flutter tech level'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LevelPage extends StatefulWidget {
  LevelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LevelPage createState() => _LevelPage();
}

class _LevelPage extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff453658),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Tech',
                  style: TextStyle(
                    fontFamily: ArabicFonts.Changa,
                    package: 'google_fonts_arabic',
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Levels',
                  style: TextStyle(
                    fontFamily: ArabicFonts.Aref_Ruqaa,
                    package: 'google_fonts_arabic',
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    topRight: Radius.circular(80.0))),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(children: <Widget>[
                      InkWell(child: _bulidlevelItem(
                          'images/kids.jpg', "Primary Level", 'Classes'),onTap: (){
                      },),
                      InkWell(child: _bulidlevelItem(
                          'images/seco.gif', "Secondary level", 'Classes'),onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => ClassesPage()));
                      },),
                      InkWell(child: _bulidlevelItem(
                          'images/train2.jpg', "Training Courses", 'Classes'),onTap: (){},),
                      InkWell(child: _bulidlevelItem(
                          'images/ideaa.jpg', "Other", 'Classes'),onTap: (){},),
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      endDrawer: Mydrawer(),
    );
  }

  Widget _bulidlevelItem(String imgPath, String levelName, String classes) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          levelName,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Changa,
                              package: 'google_fonts_arabic',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          classes,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Amiri,
                              package: 'google_fonts_arabic',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClassesPage()));
                },
              ),
            ],
          ),
        );
  }
}
