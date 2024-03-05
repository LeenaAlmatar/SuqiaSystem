import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
class Employee {
  Employee _employee = Employee();
  String firstName = ''; // Define variable to store first name input
  String lastName = ''; // Define variable to store last name input
  String email = ''; // Define variable to store email input
  String password = ''; // Define variable to store password input
  String confirmPassword = ''; // Define variable to store confirm password input
  bool _obscurePassword = true; // Variable to toggle password visibility
  bool _obscureConfirmPassword = true;
}