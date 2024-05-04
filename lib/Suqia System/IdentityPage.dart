import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:first_app/Employee/Log-in.dart';
import 'package:first_app/Employee/MapPageEmp.dart';
import 'package:first_app/Visitor/MapPageVist.dart';
import '../generated/l10n.dart';
import 'package:first_app/main.dart';

class IdentityPage extends StatefulWidget {
  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  // Define a variable to store the selected language
  Locale _locale = Locale('en');

  // Method to switch between languages
  void switchLanguage() {
    setState(() {
      // Toggle between English and Arabic
      _locale = (_locale.languageCode == 'en') ? Locale('ar') : Locale('en');
    });

    // Set the new locale
    MyApp.setLocale(context, _locale);
  }

  // Request location permissions
  Future<LocationPermission> requestLocationPermissions() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        await openAppSettings();
      }

      return permission; // Return the LocationPermission
    } catch (e) {
      print("Error requesting location permissions: $e");
      return LocationPermission.denied; // Return a valid default
    }
  }





  void _employeeIdentity() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  // Handle Visitor Button Click
  void _visitorIdentity() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).locationPermission),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final permission = await requestLocationPermissions();
                if (permission == LocationPermission.always ||
                    permission == LocationPermission.whileInUse) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MapPageVist()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).permissionDenied)),
                  );
                }
              },
              child: Text(S.of(context).ok),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(S.of(context).cancel),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: switchLanguage,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/Suqia.jpg"),
            ),
            SizedBox(height: 90),
            ElevatedButton(
              onPressed: _visitorIdentity,
              child: Text(S.of(context).visitor, style: TextStyle(color: Colors.white70)), // Access localized string using auto-generated class
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff004AAB),
                padding: EdgeInsets.symmetric(
                  horizontal: 61,
                  vertical: 16,
                ),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _employeeIdentity,
              child: Text(S.of(context).employee, style: TextStyle(color: Colors.white70)), // Access localized string using auto-generated class
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff004AAB),
                padding: EdgeInsets.symmetric(
                  horizontal: 46,
                  vertical: 16,
                ),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}