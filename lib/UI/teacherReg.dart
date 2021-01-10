import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/auth.dart';

class TeacherReg extends StatefulWidget {
  final Function toggleView;
  TeacherReg({this.toggleView});



  @override
  _TeacherRegState createState() => _TeacherRegState();
}

class _TeacherRegState extends State<TeacherReg> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

//text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String degree = '';
  String major = '';
  String price ;

  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff453658),
        elevation: 0.0,
        title: Text('Register'),

      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter FirstName' : null,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        icon: Icon(Icons.person),
                      ),
                      onChanged: (val) {
                        setState(() => firstName = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter LastName' : null,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        icon: Icon(Icons.people),
                      ),
                      onChanged: (val) {
                        setState(() => lastName = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter email' : null,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        icon: Icon(Icons.email),
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        validator: (val) => val.length < 6
                            ? 'password Should be more than 6'
                            : null,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password',
                          icon: Icon(Icons.lock),
                        ),
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Degree' : null,
                      decoration: InputDecoration(
                        hintText: 'Degree',
                        icon: Icon(Icons.paste),
                      ),
                      onChanged: (val) {
                        setState(() => degree = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Major' : null,
                      decoration: InputDecoration(
                        hintText: 'Major',
                        icon: Icon(Icons.bookmark),
                      ),
                      onChanged: (val) {
                        setState(() => major = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Price' : null,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        icon: Icon(Icons.attach_money),
                      ),
                      onChanged: (val) {
                        setState(() => price = val);
                      },
                    ),




                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      color: Colors.purpleAccent,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.registerEP(email, password);
                          if (result == null) {
                            setState(() => error = 'please supply a valid email');
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Dashboard()));
                          }
                        }
                      },

                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),


                  ],
                ),

              ))),
    );
  }
}
