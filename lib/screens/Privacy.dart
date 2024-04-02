import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class PrivacyPage extends StatelessWidget {
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
        title: Text(S.of(context).priTittle),
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
                      S.of(context).intro,//'Introduction:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).introPri,//'This privacy policy applies to our mobile application. It explains how we collect, use, and protect your personal information when you use Suqia.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).infoCollect,//'Information Collection:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).infoCollection,//'When you use our app, we may collect certain information, such as your device\'s unique identifier, location data, and app usage statistics.',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff004AAB)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).infoUse,//'Use of Information:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).infoUsage,//'We use the information we collect to improve our app\'s functionality and provide you with a personalized experience.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004AAB),                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).infoShar,//'Information Sharing:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).infoSharege,//'We do not share your personal information with third parties for marketing purposes.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004AAB),                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).dataReten,//'Data Retention:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      S.of(context).dataRetention,//'We retain your location information for as long as necessary to fulfill the purposes outlined in this policy unless a longer retention period is required or permitted by law.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004AAB),                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).lastUpd,//'Last Update: 2023/09/25',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff004AAB),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(height: 2),
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