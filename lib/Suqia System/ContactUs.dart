import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class ContactUsPage extends StatelessWidget {
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
        title: Text(S.of(context).contactUs),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Column(

              children: [
                SizedBox(height: 150),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).enquirers, //'For enquirers and support',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff004AAB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 500, // Adjust the width as needed
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F3), // Gray background
                    borderRadius: BorderRadius.circular(10), // Soft edges
                  ),
                  padding: EdgeInsets.all(16), // Padding for the container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        S.of(context).contactUs, //'Contact us:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff004AAB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color(0xff004AAB),
                          ),
                          SizedBox(width: 8),
                          Text(
                            ': 2001390000',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff004AAB),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Color(0xff004AAB),
                          ),
                          SizedBox(width: 8),
                          Text(
                            ': info@suqia.com',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff004AAB),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                    ],
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