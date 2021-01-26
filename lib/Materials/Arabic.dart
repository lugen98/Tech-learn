import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techlearning_app/UI/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:techlearning_app/services/database.dart';
import 'package:techlearning_app/UI/techlist.dart';

class Arabic extends StatefulWidget {
  @override
  _ArabicState createState() => _ArabicState();
}

class _ArabicState extends State<Arabic> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().teacher,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40, left: 20),
              ),
              Text('Tech',
                  style: TextStyle(
                      color: Color(0xFF053361),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              Text('Learn',
                  style: TextStyle(
                      color: Color(0xFFFFD900),
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ],
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            width: 40,
            height: 60,
            child: IconButton(
              color: Color(0xFF053361),
              iconSize: 28,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainHomePage()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF053361),
              ),
            ),
          ),
        ),

        body:
         TechList(),
      ));

  }
}
