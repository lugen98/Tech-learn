import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techlearning_app/UI/dashboardTest.dart';
import 'package:techlearning_app/services/users.dart';
import 'package:techlearning_app/UI/homeScreen.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
if (user == null){
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MainHomePage()));
}else {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => Dashboard()));
}
  }

}