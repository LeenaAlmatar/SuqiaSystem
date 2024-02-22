import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suqia/screens/IdentityPage.dart';
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

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IdentityPage()));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                child: Image.asset("Assets/Suqia.jpg"),
              ),
              SizedBox(height: 60),
            //   Text(
            //     S.of(context).welcome,
            //     style: TextStyle(
            //       fontSize: 24,
            //       color: Color(0xff004AAB),
            //     ),
            //   ),
            //   Text(
            //     //S.of(context).welcomeMessage,
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.normal,
            //       color: Color(0xff004AAB),
            //     ),
            //   )
            ],
          ),
        ));
  }
}