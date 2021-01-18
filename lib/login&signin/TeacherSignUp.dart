import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/login&signin/SingIn_auth.dart';
import 'package:techlearning_app/services/auth.dart';

class TeacherSignUp extends StatefulWidget {
  final Function toggleView;
  TeacherSignUp({this.toggleView});

  @override
  _TeacherSignUpState createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

//text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPass ="";
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
                        validator: (String value){
                          if(value.isEmpty)
                          {
                            return 'Please re-enter password';
                          }

                          if(password !=confirmPass){
                            return "Password does not match";
                          }

                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          icon: Icon(Icons.lock),
                        ),
                        onChanged: (val) {
                          setState(() => confirmPass = val);
                        }),
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      color: Colors.purpleAccent,
                      child: Text(
                        'Sign IN',
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
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      'Alraedy have account Sign in',
                      style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              ))),
    );
  }
}
