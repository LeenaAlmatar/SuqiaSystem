import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class AboutSuqiaPage extends StatelessWidget {
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
        title: Text(S.of(context).aboutUs),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F3), // Gray background
              borderRadius: BorderRadius.circular(10), // Soft edges
            ),
            padding: EdgeInsets.all(16), // Padding for the container
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).about, //'At Suqia we are passionate about improving your experience in the holy mosques.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).aboutSuqia, //'We will help you arrive to Zamzm water tanks by using your direction settings to guide you for the nearest Zamzm water tank based on your specifications with the highest quality and the easiest way.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}