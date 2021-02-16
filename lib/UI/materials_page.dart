import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class MaterialsPage extends StatefulWidget {
  @override
  _MaterialsPageState createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff453658),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Teaching Materials',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 24.0, color: Colors.white)),
        centerTitle: true,

      ),
      body:  SingleChildScrollView(
      child:
      Container(
     alignment: Alignment.topCenter,
        height: MediaQuery
            .of(context)
            .size
            .height - 60.0,
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(110.0),
              topRight: Radius.circular(10.0)),


        ),


        child: ListView(
            primary: false,
            padding: EdgeInsets.only(left: 50.0, top: 12.0, right: 25.0),
            children: <Widget>[
        Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Container(

                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 100,
                  child: ListView(

                      children: <Widget>[

                        _buildLevelItem(
                            "التربية الأسلامية ", "المعلمين"),
                        _buildLevelItem(
                            "اللغة العربية", "المعلمين"),
                        _buildLevelItem(
                            "اللغة الانجليزية",  "المعلمين"),
                        _buildLevelItem(
                            "الرياضيات",  "المعلمين"),
                        _buildLevelItem(
                            "العلوم ", "المعلمين"),
                        _buildLevelItem(
                            "الاجتماعيات ", "المعلمين"),
                        _buildLevelItem(
                            "الحاسوب ", "المعلمين"),
                        _buildLevelItem("الفيزياء ", "المعلمين"),
                        _buildLevelItem("الكيمياء ", "المعلمين"),
                        _buildLevelItem("الأحياء ", "المعلمين"),
                        _buildLevelItem("علوم الأرض ", "المعلمين"),


                      ]
                  ),
                ),

              )
            ]),
      ),


      ) );
  }


  Widget _buildLevelItem( String levelName, className) {
    return Container(
      child:  SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: InkWell(
          onTap: () {},
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
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
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          className,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Amiri,
                              package: 'google_fonts_arabic',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                onPressed: () {},
              ),

            ],
          ),
        )));
  }


}