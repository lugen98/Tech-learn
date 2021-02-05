import 'package:flutter/material.dart';
import 'package:teacher_profile/GUI/teatcher.dart';
//import 'package:teacher_profile/GUI/deat.dart';

void main()=> runApp ( new MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),

    );
  }


}
