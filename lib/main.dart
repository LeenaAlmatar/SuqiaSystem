import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suqia/screens/TankList.dart';
import 'package:suqia/screens/TankInfo.dart';
import 'package:suqia/screens/WelcomePage.dart';

// import 'package:suqia/generated/l10n.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

 // static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
 // Locale _locale;

  void setLocale(Locale value) {
    setState(() {
     // _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: _locale,
      // localizationsDelegates: [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      title: 'Suqia',
      home: WelcomePage(),
    );
  }
}
