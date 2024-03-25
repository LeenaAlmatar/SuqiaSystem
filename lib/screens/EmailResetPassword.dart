import 'package:flutter/material.dart';
import 'package:first_app/screens/PasswordRestVerification.dart';
import '../generated/l10n.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff004AAB)),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(S.of(context).verifPageTitle),
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
                    'Assets/Suqia.jpg', // Adjust the image path
                    width: 350,
                    height: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).passRest, //,'Resetting Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C6C6C),
                      ),
                    ),
                    SizedBox(height: 18),
                    Center(
                      child: Text(
                        S.of(context).sendEmail, //'Please enter your email to send you a code to start the process of resetting your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6C6C6C),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
                      children: [
                        Text(
                          S.of(context).email,//'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff004AAB),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: S.of(context).emailMessage,//'Enter your email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 1000,
                      height: 48.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PasswordVerificationPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ), backgroundColor: Color(0xff004AAB),
                        ),
                        child: Text(
                          S.of(context).send, //'Send',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
}