import 'package:flutter/material.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/services/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text filed state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String Register = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff453658),
        elevation: 0.0,
        title: Text('Sign In'),
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
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: SingleChildScrollView(
            child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
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
                  print(email);
                  print(password);
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'You dont have an account Register now',
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              InkWell(
                  onTap: (){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700),
              ))
            ],
          ),
        )),
      ),
    );
  }

}
