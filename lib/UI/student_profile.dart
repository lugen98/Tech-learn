import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentProfileScreenState();
  }
}

class StudentProfileScreenState extends State<StudentProfileScreen> {
  bool checkBoxValue = false;
  bool showPassword = false;
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            color:  Color(0xFF053361),
            iconSize: 30,
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Profile',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF053361),
                            fontWeight: FontWeight.w600,
                            fontSize: 18))),
                Padding(padding: EdgeInsets.only(right: 30, left: 30)),
              ])),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              buildTextField("First Name", "lugain", false),
              buildTextField("Last Name", "fareed", false),
              buildTextField("Degree", "Bachelor", false),
              buildTextField("Major", "CIS", false),
              buildTextField("Date of birth", "26/6/1998", false),

              Text("Gender",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC8CACC),
                      fontWeight: FontWeight.w700)),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,

                children: <Widget>[

                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Color(0xFFFFD900),
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text("Male",style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w700)),
                  ),

                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    activeColor:Color(0xFFFFD900),
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text("Female",style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF053361),
                          fontWeight: FontWeight.w700)),
                  ),
                ],
              ),

              Container(
                child: Column(children: <Widget>[
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: 330,
                    height: 49,
                    child: RaisedButton(
                      color: Color(0xFFFFD900),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w700)),
                      ),
                      onPressed: ()  {
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:Color(0xFF053361),
            )),
      ),
    );
  }
}
