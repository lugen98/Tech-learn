import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:teacher_profile/GUI/teacher_profile.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  bool checkBoxValue = false;
  String _name;
  String _lastName;
  String _degree;
  String _major;
  // ignore: non_constant_identifier_names
  String _Date;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "  ",
        labelText: "First Name ",
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w700)),
      ),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildlastname() {
    return TextFormField(
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _lastName = value;
      },
      decoration: InputDecoration(
        hintText: "  ",
        labelText: " Last Name",
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildDegree() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: " ",
        labelText: " Degree",
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w700)),
      ),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _degree = value;
      },
    );
  }

  Widget _buildmajor() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: " ",
        labelText: " Major",
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w700)),
      ),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _major = value;
      },
    );
  }

  Widget _buildDate() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "",
        labelText: "Date of birth (optional)",
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w700)),
      ),
      validator: (val) => val.isEmpty ? ' ' : null,
      onSaved: (String value) {
        _Date = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(" Profile"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height - 150.0,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  _buildName(),
                  _buildlastname(),
                  _buildDegree(),
                  _buildmajor(),
                  _buildDate(),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool val) {
                            setState(() {
                              checkBoxValue = val;
                            });
                          },
                        ),
                        Text(
                          "Male",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF053361),
                                  fontWeight: FontWeight.w700)),
                        ),
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (bool val) {
                            setState(() {
                              checkBoxValue = val;
                            });
                          },
                        ),
                        Text(
                          "Female",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF053361),
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 328,
                    child: RaisedButton(
                      color: Color(0xFFFFD900),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF053361),
                                fontWeight: FontWeight.w700)),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();

                        print(_name);
                        print(_lastName);
                        print(_major);
                        print(_Date);
                        print(_degree);
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
