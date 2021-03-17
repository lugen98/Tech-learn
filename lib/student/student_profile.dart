import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techlearning_app/entities/UserModel.dart';
import 'package:techlearning_app/services/auth_provider.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentProfileScreenState();
  }
}

class StudentProfileScreenState extends State<StudentProfileScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  UserModel currentUser = UserModel();
  bool checkBoxValue = false;
  bool showPassword = false;
  AuthProvider _authProvider = AuthProvider();
  int selectedRadio;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String _name;
  String _lastname;
  @override
  void initState() {
    getUser();
    super.initState();
    selectedRadio = 0;
    getUser();
  }

  void date() {
    Text("${selectedDate.toLocal()}".split(' ')[0]);
    SizedBox(
      height: 20.0,
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget _buildName() {
      return TextFormField(
        controller: _firstNameController,
        decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF053361),
                    fontWeight: FontWeight.w500)),
            labelText: " First Name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFC8CACC),
                    fontWeight: FontWeight.w700))),
        validator: (val) => val.isEmpty ? '' : null,
        onSaved: (String value) {
          _name = value;
        },
      );
    }

    Widget _buildlastname() {
      return TextFormField(
        controller: _lastNameController,
        validator: (val) => val.isEmpty ? '' : null,
        onSaved: (String value) {
          _lastname = value;
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

    SizedBox(height: size.height * 0.02);

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
            height: 20,
            width: 20,
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
          : Container(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  children: [
                    SizedBox(height: size.height * 0.02),
                    _buildName(),
                    SizedBox(height: size.height * 0.02),
                    _buildlastname(),
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
                    //         children: <Widget>[
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
                              saveUser();
                              print(_name);
                              print(_lastname);
                            },
                          ),
                        )
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

  saveUser() async {
    setState(() {
      _authProvider.isLoading = true;
    });
    UserModel result = await _authProvider.editUser(
        currentUser.id,
        _firstNameController.text,
        _lastNameController.text,
        currentUser.email,
        '',
        '',
        '',
        '',
        1);
    if(result != null)
    {
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
      });
    } catch (e) {}
  }

  saveUserInSharedPreferences(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userModel);
    pref.setString('userData', user);
  }
}
