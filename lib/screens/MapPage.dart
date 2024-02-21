import 'dart:async';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
            onPressed: () {},
          ),
          title: Text('Map Page'),
          centerTitle: true,
          backgroundColor: Color(0xFFF1F2F3),
          titleTextStyle: TextStyle(
            color: Color(0xFF0000CC),
            fontSize: 24,
          ),
        ),
        body: SingleChildScrollView(
          child:
             Text("we"),
        )
    );
  }
}
