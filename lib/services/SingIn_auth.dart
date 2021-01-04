import 'package:flutter/material.dart';
import 'package:techlearning_app/services/auth.dart';

 class SignIn extends StatefulWidget{
  @override
  _SignInState createState() => _SignInState();

  }

class _SignInState extends State<SignIn> {
   final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.blue,
       elevation: 0.0,
       title: Text('Sing In'),

     ),
     body: Container(
       padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
       child:
       RaisedButton(
         child: Text('Sign In'),
         onPressed: () async{
      dynamic result =   await _auth.SignInAnon();
      if(result==null){
        print('error Signing in');
      }else{
        print('signed in');
        print(result.uid);
      }
         },
       ) ,
     ),


   );
  }

}


