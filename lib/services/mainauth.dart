
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techlearning_app/services/Wrapper.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/services/users.dart';

class Mainauth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Mainauth();
  }
}

class _Mainauth extends State<Mainauth> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        )
    );
  }
}