import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:suqia/screens/Log-in.dart';
import 'package:suqia/screens/MapPage.dart';

class IdentityPage extends StatefulWidget {
  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  // Define a variable to store the selected language
  String selectedLanguage = 'English'; // Default language

  // Method to switch between languages
  void switchLanguage() async {
    setState(() {
      selectedLanguage = (selectedLanguage == 'English') ? 'Arabic' : 'English';
    });

    // Reload the app with the new locale
    final locale = selectedLanguage == 'English' ? Locale('en', 'US') : Locale('ar', 'AE');
   // await AppLocalizations.of(context).load(locale);
  //  MyAppState.of(context).setLocale(locale);
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }

  Future<void> requestLocationPermissions() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final PermissionStatus status = await Permission.location.request();
      if (status.isGranted) {
        // Location permissions granted
      } else if (status.isDenied) {
        // Location permissions denied
      } else if (status.isPermanentlyDenied) {
        // Location permissions permanently denied, open app settings
        await openAppSettings();
      }
    } else {
      // Location permissions already granted
    }
  }

  void _employeeSignIn() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _visitorSignIn() {
    // requestNotificationPermissions().then((_) {
    //   requestLocationPermissions().then((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MapPage()));
      // });
    // });
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
              child: Image.asset("Assets/Suqia.jpg"),
            ),
            SizedBox(height: 90),
            ElevatedButton(
              onPressed: _visitorSignIn,
              child: Text('Visitor', style: TextStyle(color: Colors.white70)),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff004AAB),
                padding: EdgeInsets.symmetric(
                  horizontal: 61,
                  vertical: 16,
                ),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _employeeSignIn,
              child: Text('Employee', style: TextStyle(color: Colors.white70)),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff004AAB),
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
