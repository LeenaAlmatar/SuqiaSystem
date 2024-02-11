import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suqia/SignInPage.dart';
import 'package:suqia/MapPage.dart';
import 'package:suqia/WelcomePage.dart';

class IdentityPage extends StatefulWidget {
  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  void _employeeSignIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  void _visitorSignIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MapPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset("Assets/Suqia.jpg"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _visitorSignIn,
            child: Text('Visitor', style: TextStyle(color: Colors.white70)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff004AAB),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: _employeeSignIn,
            child: Text('Employee', style: TextStyle(color: Colors.white70)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff004AAB),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
