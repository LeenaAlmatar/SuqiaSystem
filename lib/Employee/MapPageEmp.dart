import 'package:flutter/material.dart';
import 'package:first_app/Employee/TankListEmp.dart';
import 'package:first_app/Employee/settingEmp.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:first_app/Employee/TankInfoEmp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../generated/l10n.dart';

class MapPageEmp extends StatefulWidget {
  @override
  _MapPageEmpState createState() => _MapPageEmpState();
}

class _MapPageEmpState extends State<MapPageEmp> {
  List<Map<String, dynamic>> tankInfoList = [];

  @override
  void initState() {
    super.initState();
    fetchTankInfoFromFirestore();
  }

  Future<void> fetchTankInfoFromFirestore() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Tanks').get();
    setState(() {
      tankInfoList = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( S.of(context).mapTittle),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.reference().child('Tank').onValue,
        builder: (context, realtimeSnapshot) {
          if (realtimeSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (realtimeSnapshot.hasError) {
            return Center(child: Text('Error: ${realtimeSnapshot.error}'));
          }

          List<Map<String, dynamic>> realtimeTanks = [];
          var snapshotValue = realtimeSnapshot.data?.snapshot?.value;

          if (snapshotValue is Map) {
            if (snapshotValue.containsKey("Floor")) {
              var tankData = {
                'Number': snapshotValue['Number'] ?? "Unknown",
                'Floor': snapshotValue['Floor'] ?? "Unknown",
                'Latitude': (snapshotValue['Latitude'] ?? 0.0).toDouble(),
                'Longitude': (snapshotValue['Longitude'] ?? 0.0).toDouble(),
                'distance': snapshotValue['distance'] ?? "Unknown",
                'Status': (snapshotValue['waterLevelPercentage'] ?? 0) <= 10 ? 'Empty' : 'Full',
                'Temperature': (snapshotValue['temperatureC'] ?? 0) <= 20 ? 'Cold' : 'Warm',
              };

              realtimeTanks.add(tankData);
            }
          }

          final allTanks = [...tankInfoList, ...realtimeTanks];

          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  center: LatLng(21.4225, 39.8262),
                  zoom: 18.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: allTanks.map((tankInfo) => createTankMarker(context, tankInfo)).toList(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      // Adding the Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
            bottom: Radius.circular(40),
          ),
          child: BottomAppBar(
            color: Color(0xff004AAB),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  color: Color(0xff004AAB),
                  elevation: 0,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topLeft: Radius.circular(80),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff0054bb),
                          spreadRadius: 50,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapPageEmp()),
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TankListEmp()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Marker createTankMarker(BuildContext context, Map<String, dynamic> tankInfo) {
    return Marker(
      point: LatLng(
        (tankInfo['Latitude'] ?? 0.0).toDouble(),
        (tankInfo['Longitude'] ?? 0.0).toDouble(),
      ),
      width: 30,
      height: 90,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TankInfoEmp(
                tankInfo: [
                  tankInfo['Number'].toString(),
                  tankInfo['Status'],
                  tankInfo['Floor'],
                  tankInfo['Temperature'],
                ],
              ),
            ),
          );
        },
        child: Icon(
          tankInfo['Status'] == 'Full' ? Icons.local_drink : Icons.local_drink_outlined,
          size: 30,
          color: tankInfo['Status'] == 'Full' ? Colors.lightBlueAccent : Colors.grey,
        ),
      ),
    );
  }
}
