import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class VerificationPage extends StatelessWidget {
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
                    S.of(context).verifyEmail,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C6C6C),
                      ),
                    ),
                    SizedBox(height: 18),
                    Center(
                      child: Text(
                        S.of(context).emailCode,
                        //'Please check your email and enter the code below to verify your email.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6C6C6C),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        S.of(context).codeTime,
                        //'The code will expire in 2 minutes.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6C6C6C),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: List.generate(
                        4,
                            (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFD9D9D9)), // Change box color to D9D9D9
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                  counterText: '', // Remove the counter text
                                ),
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 18), // Adjust the font size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 1000,
                            height: 48.0,
                            child: ElevatedButton(
                              onPressed: () {


                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ), backgroundColor: Color(0xff004AAB),
                              ),
                              child: Text(
                                S.of(context).verifyButton,
                                //'Verify',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Resend code functionality
                                },
                                child: Text(
                                    S.of(context).resendCode,
                                  //'Resend Code',
                                  style: TextStyle(
                                    color: Color(0xFF33363F),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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