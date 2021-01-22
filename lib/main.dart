import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techlearning_app/services/auth.dart';
import 'package:techlearning_app/services/users.dart';
import 'UI/SplashScreen.dart';

void main() {
  runApp(
      DevicePreview(
    builder: (context) =>  MyApp(),
    enabled: !kReleaseMode,
  ));
     // MyApp());
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
    return LayoutBuilder(
        builder: (context, constraints) {
      return OrientationBuilder(
          builder: (context, orientation) {
            return StreamProvider<User>.value(
                value: AuthService().user,
                child: MaterialApp(
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                  ),
                  debugShowCheckedModeBanner: false,
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  home: SplashScreen(),
                )
            );
          }
          );
      }
    );

  }
}
