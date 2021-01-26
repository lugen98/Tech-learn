import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TechList extends StatefulWidget {
  @override
  _TechListState createState() => _TechListState();
}

class _TechListState extends State<TechList> {
  @override
  Widget build(BuildContext context) {
    final teacher = Provider.of<QuerySnapshot>(context);
   // print(teacher.documents);
    for(var doc in teacher.documents){
      print(doc.data);
    }
    return Container();
  }
}
