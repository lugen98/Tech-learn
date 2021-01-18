import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/login&signin/SingIn_auth.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/techlearnproject_app/lib/login&signin/register.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState  createState() => _AuthenticateState();

  }
  class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }


    @override
    Widget build(BuildContext context) {
      if (showSignIn){
        return Register(toggleView: toggleView);
      }else{
        return SignIn(toggleView: toggleView);
      }
    }
  }