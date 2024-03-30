import 'package:flutter/material.dart';
import 'package:suqia/screens/directions.dart';
import 'package:suqia/screens/TankListEmp.dart';
import '../generated/l10n.dart';
import 'package:latlong2/latlong.dart';


class TankInfoVist extends StatelessWidget {
  List<String> TankInfo;
  LatLng tank1= LatLng(21.4225, 39.82674);
  LatLng tank2= LatLng(21.4225, 39.8266);
  LatLng tank3=LatLng(21.4221, 39.82648);
  LatLng tank4=LatLng(21.4220, 39.82615);
  LatLng tank5=LatLng(21.4221, 39.82577);
  LatLng tank6=LatLng(21.4225, 39.82558);
  LatLng tank7= LatLng(21.4227, 39.82567);
  LatLng tank8= LatLng(21.4229, 39.82577);
  LatLng tank9=LatLng(21.4230, 39.82598);
  LatLng tank10 =LatLng(21.4230, 39.82636);
  LatLng tank11 =LatLng(21.4228, 39.82652);
  LatLng tank12 =LatLng(21.4229, 39.82664);

  TankInfoVist({required this.TankInfo});

  @override
  Widget build(BuildContext context) {
    // Extract information from tankInfo list
    String tankNumber = TankInfo[0];
    String status = TankInfo[1];
    String floor = TankInfo[2];
    String temperature = TankInfo[3];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TankListEmp()));
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
                  child: Image.asset(
                    tankNumber == '1' || tankNumber == '3' ? "assets/Gtank.png" : "assets/tank.png",
                  ),
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
                    LatLng destination;
                    switch (tankNumber) {
                      case '1':
                        destination = tank1;
                        break;
                      case '2':
                        destination = tank2;
                        break;
                      case '3':
                        destination = tank3;
                        break;
                      case '4':
                        destination = tank4;
                        break;
                      case '5':
                        destination = tank5;
                        break;
                      case '6':
                        destination = tank6;
                        break;
                      case '7':
                        destination = tank7;
                        break;
                      case '8':
                        destination = tank8;
                        break;
                      case '9':
                        destination = tank9;
                        break;
                      case '10':
                        destination = tank10;
                        break;
                      case '11':
                        destination = tank11;
                        break;
                      case '12':
                        destination = tank12;
                        break;
                      default:
                        destination = LatLng(21.4222, 39.82670); // Default destination
                        break;
                    }
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => DierPage(
                          destination: destination,
                        ),
                      ),
                    );
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