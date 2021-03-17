import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/auth_provider.dart';

class TeacherProfile extends StatefulWidget {
  @override
  TeacherProfileState createState() => TeacherProfileState();
}

class TeacherProfileState extends State<TeacherProfile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _degreeController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  UserModel currentUser = UserModel();
  bool checkBoxValue = false;
  bool showPassword = false;
  int selectedRadio;
  String _firstName;
  String _lastName;
  String _degree;
  String _major;
  String _date;
  AuthProvider _authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Color(0xFF053361),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
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
      body: (currentUser == null || _authProvider.isLoading)
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                padding: EdgeInsets.only(right: 15, left: 15),
                children: [
                  SizedBox(height: size.height * 0.02),
                  _buildFirstName(),
                  SizedBox(height: size.height * 0.02),
                  _buildLastName(),
                  SizedBox(height: size.height * 0.02),
                  _buildDegree(),
                  SizedBox(height: size.height * 0.02),
                  _buildMajor(),
                  SizedBox(height: size.height * 0.02),
                  _buildEmail(),
                  SizedBox(height: size.height * 0.02),
                  _buildPhone(),
                  SizedBox(height: size.height * 0.02),

                  // _buildDate(),
                  // SizedBox(height: size.height * 0.02),
                  // Padding(
                  //     padding: EdgeInsets.only(right: 10, left: 10, top: 10)),
                  // Text(
                  //   "Gender",
                  //   style: GoogleFonts.poppins(
                  //       textStyle: TextStyle(
                  //           fontSize: 16,
                  //           color: Color(0xFFC8CACC),
                  //           fontWeight: FontWeight.w700)),
                  // ),
                  // Container(
                  //   child: Row(
                  //     children: <Widget>[
                  //       ButtonBar(
                  //         //  alignment: MainAxisAlignment.spaceEvenly,
                  //
                  //         children: <Widget>[
                  //           //    Padding(padding: EdgeInsets.only(right: 50,top: 10)),
                  //
                  //           Radio(
                  //             value: 1,
                  //             groupValue: selectedRadio,
                  //             activeColor: Color(0xFFFFD900),
                  //             onChanged: (val) {
                  //               print("Radio $val");
                  //               setSelectedRadio(val);
                  //             },
                  //           ),
                  //           Text(
                  //             "Male",
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Color(0xFF053361),
                  //                     fontWeight: FontWeight.w500)),
                  //           ),
                  //           //  Padding(padding: EdgeInsets.only( left: 50,top: 10)),
                  //
                  //           Radio(
                  //             value: 2,
                  //             groupValue: selectedRadio,
                  //             activeColor: Color(0xFFFFD900),
                  //             onChanged: (val) {
                  //               print("Radio $val");
                  //               setSelectedRadio(val);
                  //             },
                  //           ),
                  //           Text(
                  //             "Female",
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 16,
                  //                     color: Color(0xFF053361),
                  //                     fontWeight: FontWeight.w500)),
                  //           ),
                  //           //    Padding(
                  //           //  padding: EdgeInsets.only(right: 90, left: 60, top: 10)),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 49,
                        width: 350,
                        child: RaisedButton(
                          color: Color(0xFFFFD900),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Save",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF053361),
                                    fontWeight: FontWeight.w700)),
                          ),
                          onPressed: () {
                            print(_firstName);
                            print(_lastName);
                            print(_major);
                            print(_date);
                            print(_degree);
                            saveUser();
                          },
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      controller: _firstNameController,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: 'First Name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: _lastNameController,
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _lastName = value;
      },
      decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: " Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
    );
  }

  Widget _buildDegree() {
    return TextFormField(
      controller: _degreeController,
      decoration: InputDecoration(
          hintText: currentUser.degree,
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: " Degree",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _degree = value;
      },
    );
  }

  Widget _buildMajor() {
    return TextFormField(
      controller: _majorController,
      decoration: InputDecoration(
          hintText: "cis ",
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: " Major",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
      validator: (val) => val.isEmpty ? '' : null,
      onSaved: (String value) {
        _major = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      readOnly: true,
      controller: _emailController,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: 'Email',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      readOnly: true,
      controller: _phoneController,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF053361),
                  fontWeight: FontWeight.w500)),
          labelText: 'Phone',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC8CACC),
                  fontWeight: FontWeight.w700))),
    );
  }

  Widget _buildDate() {
    return TextFormField(
      onTap: () {
        setState(() {
          _selectDate(context);
        });
      },
      readOnly: true,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 17,
                color: Color(0xFF053361),
                fontWeight: FontWeight.w500)),
        hintText: (selectedDate.toString().split(' ')[0]),
        labelText: "Date of birth",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Image.asset(
          'assets/images/Vector.jpg',
          height: 20.0,
          width: 20.0,
        ),
        labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 18,
                color: Color(0xFFC8CACC),
                fontWeight: FontWeight.w700)),
      ),
      validator: (val) => val.isEmpty ? ' ' : null,
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  saveUser() async {
    setState(() {
      _authProvider.isLoading = true;
    });
    UserModel result = await _authProvider.editUser(
        currentUser.id,
        _firstNameController.text,
        _lastNameController.text,
        _emailController.text,
        '',
        _degreeController.text,
        _majorController.text,
        _phoneController.text,
        0);
    if (result != null) {
      saveUserInSharedPreferences(result);
    }
    setState(() {
      _authProvider.isLoading = false;
    });
  }

  void getUser() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userString = pref.getString('userData');
      Map json = jsonDecode(userString);
      currentUser = UserModel.fromJson(json);
      setState(() {
        _firstNameController.text = currentUser.firstname;
        _lastNameController.text = currentUser.lastname;
        _degreeController.text = currentUser.degree;
        _majorController.text = currentUser.major;
        _emailController.text = currentUser.email;
        _phoneController.text = currentUser.phone.toString();
      });
    } catch (e) {}
  }

  saveUserInSharedPreferences(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userModel);
    pref.setString('userData', user);
  }
}
