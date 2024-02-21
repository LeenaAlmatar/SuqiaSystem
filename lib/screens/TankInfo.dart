import 'package:flutter/material.dart';
import 'package:suqia/screens/LoginPage.dart';

class TankInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
          onPressed: () {},
        ),
        title: Text('Tank Information'),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xFF0000CC),
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
                  child: Text(
                    'Tank Number: 19',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6666FF),
                    ),
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
                    SizedBox(height: 8),
                    Text(
                      'Temperature:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6666FF),
                      ),
                    ),
                    SizedBox(height: 16),
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
                            primary: Color(0xFF6666FF),
                          ),
                          child: Text(
                            'Locate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
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
