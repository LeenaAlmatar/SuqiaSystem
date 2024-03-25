import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_app/screens/IdentityPage.dart';

import '../generated/l10n.dart';

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
                child: Image.asset("assets/Suqia.jpg"),
              ),
              SizedBox(height: 60),
              Text(
                S.of(context).welcome,
                //"Welcome To Suqia",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff004AAB),
                ),
              ),
              Text(
                S.of(context).welcomeMessage,
                //"Where you can reach water Zamzam easily!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff004AAB),
                ),
              )
            ],
          ),
        ));
  }
}