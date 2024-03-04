import 'package:flutter/material.dart';
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
                context, MaterialPageRoute(builder: (context) => MapPage()));
          },
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
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("Assets/tank.png"),
                ),
                Text(
                  'Tank Number: 19',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff004AAB),
                  ),
                ),
              ],
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                color: Colors.white60,
                margin: EdgeInsets.all(22),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Tank status:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Empty', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      //leading: Icon(Icons.location_pin, color: Color(0xff004AAB)),
                      title: Text('Floor:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_pin, color: Color(0xff004AAB)),
                              SizedBox(width: 7),
                              Text('1st Floor', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ListTile(
                      //leading: Icon(Icons.thermostat, color: Color(0xff004AAB)),
                      title: Text('Temperature:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: Color(0xff004AAB)),
                              SizedBox(width: 8),
                              Text('Cold', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: 340,
                height: 36.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
