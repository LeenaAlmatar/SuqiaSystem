import 'package:flutter/material.dart';
import 'package:suqia/screens/LoginPage.dart';
import 'package:suqia/screens/MapPage.dart';

class TankInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MapPage()));},
        ),
        title: Text('Tank Information'),
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                margin: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Tank Number: 19',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff004AAB),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.check_circle, color: Color(0xff004AAB)),
                      title: Text('Tank status:'),
                      subtitle: Text('Empty'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_pin, color: Color(0xff004AAB)),
                      title: Text('Floor:'),
                      subtitle: Text('1st Floor'),
                    ),
                    ListTile(
                      leading: Icon(Icons.thermostat, color: Color(0xff004AAB)),
                      title: Text('Temperature:'),
                      subtitle: Text('20°C'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 36.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: Color(0xff004AAB),
                  ),
                  child: Text(
                    'Locate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}