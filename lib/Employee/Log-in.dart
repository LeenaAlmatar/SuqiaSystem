import 'package:flutter/material.dart';
import 'package:first_app/Employee/EmailResetPassword.dart';
import 'package:first_app/Employee/sign-up.dart';
import 'package:first_app/Employee/MapPageEmp.dart';
import 'package:first_app/Suqia System/IdentityPage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:first_app/Employee/Employee.dart';
import '../generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController(); // Define variable to store email input
  final LogpasswordController = TextEditingController(); // Define variable to store password input
  String email = '';
  String password = '';
  bool rememberMe = false;
  bool _obscurePassword = true;
  List<DocumentSnapshot> data = [];

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("some error occurred");
    }
    return null;
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

  @override
  void dispose() {
    emailController.dispose();
    LogpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff004AAB)),
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IdentityPage()),
            );
          },
        ),
        title: Text(S.of(context).loginPage),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/Suqia.jpg',
                    width: 350,
                    height: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).email,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: S.of(context).emailMessage,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      S.of(context).password,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: LogpasswordController,
                      decoration: InputDecoration(
                        hintText: S.of(context).passMessage,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value; // Update the password variable
                        });
                      },
                      obscureText: _obscurePassword,
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                        );
                      },
                      child: Text(
                        S.of(context).passForget,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff004AAB),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: _onRememberMeChanged,
                            ),
                            Text(
                              S.of(context).rememberMe,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 36.0,
                        child: ElevatedButton(
                          onPressed: () {
                            _signIn();

                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xff004AAB),
                          ),
                          child: Text(
                            S.of(context).loginPage,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).noAccount,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(
                            S.of(context).signUpButton,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff004AAB),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String DEmail = emailController.text;
    String DPassword = LogpasswordController.text;
    User? user = await signInWithEmailAndPassword(DEmail, DPassword);

    if (user != null) {
      print("User successfully logged in.");
      if (rememberMe) {
        // Store credentials if "Remember Me" is checked
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', DEmail);
        prefs.setString('password', DPassword);
      }

      // Show location permission dialog after successful login
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
                      MaterialPageRoute(builder: (context) => MapPageEmp()),
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).wrongEmailorPassword),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Check if credentials are stored and set rememberMe accordingly
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        rememberMe = prefs.getBool('rememberMe') ?? false;
        if (rememberMe) {
          // Retrieve stored email and password
          String storedEmail = prefs.getString('email') ?? '';
          String storedPassword = prefs.getString('password') ?? '';
          // Set text in controllers
          emailController.text = storedEmail;
          LogpasswordController.text = storedPassword;
        }
      });
    });
  }

  // When the "Remember Me" checkbox is changed
  void _onRememberMeChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        rememberMe = newValue;
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('rememberMe', rememberMe);
        });
      });
    }
  }
}