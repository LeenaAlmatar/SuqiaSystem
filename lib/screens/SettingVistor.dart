import 'package:flutter/material.dart';
import 'package:suqia/screens/MapPage.dart';
import 'package:suqia/screens/TankList.dart';
import 'package:suqia/screens/Language.dart';
import 'package:suqia/screens/Privacy.dart';
import 'package:suqia/screens/ContactUs.dart';
import 'package:suqia/screens/AboutSuqia.dart';
import '../generated/l10n.dart';

class SettingsPageVistor extends StatelessWidget {
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
        title: Text(S.of(context).setTitle),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                _buildOptionCard(
                  context,
                  S.of(context).language,//'Language',
                  () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LanguagePage()));
                  },
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguagePage()),
                    );
                  },
                ),
                SizedBox(height: 10),
                _buildOptionCard(
                  context,
                  S.of(context).privacy,//'Privacy',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPage()),
                    );
                  },
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPage()),
                    );
                  },
                ),
                SizedBox(height: 10),
                _buildOptionCard(
                  context,
                  S.of(context).contactUs,//'Contact us',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()),
                    );
                  },
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()),
                    );
                  },
                ),
                SizedBox(height: 10),
                _buildOptionCard(
                  context,
                  S.of(context).aboutUs,//'About us',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutSuqiaPage()),
                    );
                  },
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutSuqiaPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: 8), // Adjust the padding value as needed
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(40), bottom: Radius.circular(40)),
          child: BottomAppBar(
            color: Color(0xff004AAB),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TankList()),
                    );
                  },
                ),
                Material(
                  color: Color(0xff004AAB),
                  elevation: 0, // Set elevation to 0 to prevent double shadows
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    width: 60, // Adjust the width as needed
                    height: 60, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topLeft: Radius.circular(80),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                              0xff0054bb), // Adjust the shadow color and opacity
                          spreadRadius:
                              50, // Adjust the spread radius to make the shadow wider
                          blurRadius:
                              2, // Adjust the blur radius for smoother edges
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPageVistor()),
                        );
                      },
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

  Widget _buildOptionCard(
    BuildContext context,
    String title,
    Function() onTap,
    Function() onArrowForwardPressed,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Color(0xFF9199A1)),
      ),
      elevation: 1.0,
      color: Colors.white,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF33363F),
              ),
            ),
            InkWell(
              onTap: onArrowForwardPressed,
              child: Icon(
                Icons.arrow_forward,
                color: Color(0xff004AAB),
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
