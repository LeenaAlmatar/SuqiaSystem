import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'en';

  void _changeLanguage(String languageCode) {
    Locale newLocale = Locale(languageCode);
    setState(() {
      S.load(newLocale);
    });
  }

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
        title: Text(S.of(context).language),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F3), // Gray background
                    borderRadius: BorderRadius.circular(10), // Soft edges
                  ),
                  padding: EdgeInsets.all(16), // Padding for the container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).lanSelect,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff004AAB),
                        ),
                      ),
                      SizedBox(height: 8),
                      RadioListTile(
                        title: Text(
                          S.of(context).lanEn,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF333333),
                          ),
                        ),
                        value: 'en',
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          _changeLanguage(value.toString());
                          setState(() {
                            selectedLanguage = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          S.of(context).lanAr,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF333333),
                          ),
                        ),
                        value: 'ar',
                        groupValue: selectedLanguage,
                        onChanged: (value) {
                          _changeLanguage(value.toString());
                          setState(() {
                            selectedLanguage = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show pop-up notification for successful reset
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(S.of(context).langMessg),
                            content: Text(S.of(context).lanSelect + '$selectedLanguage'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(S.of(context).ok),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ), backgroundColor: Color(0xff004AAB),
                    ),
                    child: Text(
                      S.of(context).lanChange,
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
      ),
    );
  }
}
