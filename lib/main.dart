import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

import 'UI/SplashScreen.dart';
import 'localization/translations_delegate_base.dart';


void main() {
  runApp(ScopeModelWrapper());
}

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppLocalizationModel>(
        model: AppLocalizationModel.shared, child: MyApp());
  }
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
    return ScopedModelDescendant<AppLocalizationModel>(
      builder: (context, child, model) => MaterialApp(
        locale: AppLocalizationModel.shared.appLocal,
        localizationsDelegates: [
          const TranslationBaseDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', ''), // Arabic
          const Locale('en', ''), // English
        ],
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        debugShowCheckedModeBanner :false,
        home:
        SplashScreen(),
      ),
    );
  }
}