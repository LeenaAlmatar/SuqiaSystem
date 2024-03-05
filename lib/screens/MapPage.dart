import 'dart:async';
import 'package:flutter/material.dart';
import 'package:suqia/screens/TankList.dart';
import 'package:suqia/screens/SettingVistor.dart';
import 'package:suqia/screens/settingEmp.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: 8), // Adjust the padding value as needed
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(40), bottom: Radius.circular(40)),
          child: BottomAppBar(
            color: Color(0xff004AAB),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => TankList()));
                  },
                ),
                Material(
                  color: Color(0xff004AAB),
                  elevation: 0, // Set elevation to 0 to prevent double shadows
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    width: 60, // Adjust the width as needed
                    height: 60, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topLeft: Radius.circular(80),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                              0xff0054bb), // Adjust the shadow color and opacity
                          spreadRadius:
                              50, // Adjust the spread radius to make the shadow wider
                          blurRadius:
                              2, // Adjust the blur radius for smoother edges
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
