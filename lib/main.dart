import 'package:flutter/material.dart';

import 'splash_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
    // return OrientationBuilder(builder: (context, orientation) {
    //   return StreamProvider<User>.value(
    //       value: AuthService().user,
    //       child: MaterialApp(
    //         theme: ThemeData(
    //           primarySwatch: Colors.indigo,
    //         ),
    //         debugShowCheckedModeBanner: false,
    //         home: SplashScreen(),
    //       ));
    // });
  }
}
