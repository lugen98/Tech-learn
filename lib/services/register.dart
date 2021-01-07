import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/SingIn_auth.dart';
import 'package:techlearning_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

//text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff453658),
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Sign IN',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
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
                        return Dashboard();
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
                  height: 12.0,
                ),
                Text(
                  'Alraedy have account Sign In',
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
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
