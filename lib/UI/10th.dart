import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class TenthPage extends StatefulWidget {
  @override
  _TenthPageState createState() => _TenthPageState();
}

class _TenthPageState extends State<TenthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff453658),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Tech Learn',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 24.0, color: Colors.white)),
        centerTitle: true,

      ),
      body: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery
            .of(context)
            .size
            .height - 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(110.0),
              topRight: Radius.circular(10.0)),


        ),


        child: ListView(
            primary: false,
            padding: EdgeInsets.only(left: 50.0, top: 50.0, right: 25.0),
            children: <Widget>[
              Text(
                'Teaching Materials \n مواد التدريس ',
                style: TextStyle(
                    fontFamily: ArabicFonts.El_Messiri,
                    package: 'google_fonts_arabic',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: Container(

                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 300,
                  child: ListView(

                      children: <Widget>[

                        _bulidlevelItem(
                            "التربية الأسلامية ", "المعلمين"),
                        _bulidlevelItem(
                            "اللغة العربية", "المعلمين"),
                        _bulidlevelItem(
                            "اللغة الانجليزية",  "المعلمين"),
                        _bulidlevelItem(
                            "الرياضيات",  "المعلمين"),
                        _bulidlevelItem(
                            "العلوم ", "المعلمين"),
                        _bulidlevelItem(
                            "الاجتماعيات ", "المعلمين"),
                        _bulidlevelItem(
                            "الحاسوب ", "المعلمين"),
                        _bulidlevelItem("الفيزياء ", "المعلمين"),
                        _bulidlevelItem("الكيمياء ", "المعلمين"),
                        _bulidlevelItem("الأحياء ", "المعلمين"),
                        _bulidlevelItem("علوم الأرض ", "المعلمين"),


                      ]
                  ),
                ),

              )
            ]),
      ),

      // drawer: Mydrawer(),
    );
  }


  Widget _bulidlevelItem( String levelName, className) {
    return Padding(
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
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          className,
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
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                onPressed: () {},
              ),

            ],
          ),
        ));
  }


}