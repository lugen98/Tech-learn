import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
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
  final _formKey = GlobalKey<FormState>();

  //text filed state
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
        title: Text('Sign In'),
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
                    dynamic result = await _auth.signInEP(email, password);
                    if (result == null) {
                      setState(() => error = 'Failed To Sign In');
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
                'You dont have an account Register now',
                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w700),
              ),
              InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
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
