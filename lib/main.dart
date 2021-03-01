import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/services/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/splash_screen.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
      return OrientationBuilder(builder: (context, orientation) {
        return StreamProvider<User>.value(
            value: AuthService().user,
            child: MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ));
      });

  }
}
