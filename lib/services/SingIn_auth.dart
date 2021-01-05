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
       child: Form(
         child: Column(
           children: <Widget>[
             SizedBox(height: 20.0,),

             TextFormField(
               decoration: InputDecoration(
                 hintText: 'First Name',
                 icon: Icon(Icons.person),
               ),
               onChanged: (val){

               },
             ),
             SizedBox(height: 20.0,),
             TextFormField(
               decoration: InputDecoration(
                 hintText: 'Last Name',
                 icon: Icon(Icons.people),
               ),
               onChanged: (val){

               },
             ),
             SizedBox(height: 20.0,),
             TextFormField(
               obscureText: true,
               decoration: InputDecoration(
                 hintText: 'password',
                 icon: Icon(Icons.lock),
               ),


               onChanged: (val) {}
             ),

             SizedBox(height: 20.0,),

             TextFormField(
               decoration: InputDecoration(
                 hintText: 'E-mail',
                 icon: Icon(Icons.email),
               ),
               onChanged: (val){

               },
             ),

             SizedBox(height: 20.0,),
             RaisedButton(
               color: Colors.purpleAccent,
               child: Text('Sign IN',
                 style: TextStyle(color: Colors.white),
             ),
               onPressed: () async{

               },
             )
    ],
         ),
       )

     ),


   );
  }

}


