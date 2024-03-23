import 'package:flutter/material.dart';
import 'package:suqia/screens/MapPage.dart';
import 'package:suqia/screens/TankList.dart';
import '../generated/l10n.dart';


class TankInfo extends StatelessWidget {
  final List<String> tankInfo;

  TankInfo({required this.tankInfo});

  @override
  Widget build(BuildContext context) {
    // Extract information from tankInfo list
    String tankNumber = tankInfo[0];
    String status = tankInfo[1];
    String floor = tankInfo[2];
    String temperature = tankInfo[3];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TankList()));
          },
        ),
        title: Text(S.of(context).tInfoTitle),
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
                SizedBox(
                  width: 7,
                ),
                Column(
                  children: [
                    Text(
                      S.of(context).tankNum +': $tankNumber',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    Text(
                      S.of(context).refillCount +': 12', // Refill Count Per Day remains unchanged
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff004AAB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color(0xffe0e0e0),
                margin: EdgeInsets.all(22),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(S.of(context).tStatus + ':',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: status == "Full" ? Color(0xff004AAB) : Colors.grey),
                              SizedBox(width: 8),
                              Text(status, style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(S.of(context).floor +':',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_pin,
                                  color: Color(0xff004AAB)),
                              SizedBox(width: 7),
                              Text(floor, style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(S.of(context).temperature+':',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff004AAB),
                          )),
                      subtitle: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.all(20), // Adjust margin
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: temperature == "Cold" ? Color(0xff004AAB) : Colors.red),
                              SizedBox(width: 8),
                              Text(temperature, style: TextStyle(fontSize: 18)),
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
                width: 350,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ), backgroundColor: Color(0xff004AAB),
                  ),
                  child: Text(
                    S.of(context).locate,
                    //'Locate',
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
