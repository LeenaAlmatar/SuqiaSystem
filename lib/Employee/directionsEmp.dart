import 'package:flutter/material.dart';
import 'package:first_app/Employee/TankListEmp.dart';
import 'package:first_app/Employee/settingEmp.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:first_app/Employee/TankInfoEmp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


class DierPageEmp extends StatefulWidget {
  final LatLng destination;
  DierPageEmp({required this.destination});
  @override
  _DierPageState createState() => _DierPageState(destination: destination);
}

class _DierPageState extends State<DierPageEmp> {
  final LatLng destination;
  LatLng _userLocation = LatLng(21.4222, 39.82670); // Default location (0, 0)
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  _DierPageState({required this.destination});
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
        title: Text("Map"),
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
                    markers: [
                      Marker(
                        point: _userLocation,
                        width: 80,
                        height: 80,
                        builder: (context) => Icon(
                          Icons.person_pin_circle,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      ...allTanks.map((tankInfo) => createTankMarker(context, tankInfo)).toList(),
                    ],
                  ),
                  PolylineLayer(
                    polylines: [

                      destination==tank12 ? Polyline(
                        points: [
                          LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4225, 39.82653),
                          LatLng(21.4226, 39.82653),
                          LatLng(21.4227, 39.82649),
                          LatLng(21.4228, 39.82640),
                          LatLng(21.4229, 39.82646),
                          LatLng(21.4229, 39.82654),
                          LatLng(21.4229, 39.82659)
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3, // Width of the route polyline
                      ):

                      destination==tank11 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4225, 39.82653),
                          LatLng(21.4226, 39.82653),
                          LatLng(21.4227, 39.82649),
                          LatLng(21.4228, 39.82640),
                          LatLng(21.4228, 39.82646),

                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):                 destination==tank10 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4225, 39.82653),
                          LatLng(21.4226, 39.82653),
                          LatLng(21.4227, 39.82649),
                          LatLng(21.4228, 39.82640),
                          LatLng(21.4229, 39.82624),
                          LatLng(21.4230, 39.82627),
                          LatLng(21.4230, 39.82631),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):        destination==tank9 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4225, 39.82653),
                          LatLng(21.4226, 39.82653),
                          LatLng(21.4227, 39.82649),
                          LatLng(21.4228, 39.82640),
                          LatLng(21.4229, 39.82616),
                          LatLng(21.4229, 39.82610),
                          LatLng(21.4230, 39.82610),
                          LatLng(21.4230, 39.8260),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):     destination==tank8 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4225, 39.82653),
                          LatLng(21.4226, 39.82653),
                          LatLng(21.4227, 39.82649),
                          LatLng(21.4228, 39.82640),
                          LatLng(21.4229, 39.82616),
                          LatLng(21.4229, 39.82610),
                          LatLng(21.4229, 39.82612),
                          LatLng(21.4229, 39.826),
                          LatLng(21.4229, 39.8258),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):     destination==tank1 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4223, 39.82677),
                          LatLng(21.4225, 39.82678),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank2 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4224, 39.82652),
                          LatLng(21.4224, 39.8266),
                          LatLng(21.4225, 39.8266),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank3 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4221, 39.82653),

                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank4 ?Polyline(
                        points: [  LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4222, 39.82630),
                          LatLng(21.4221, 39.82615),
                          LatLng(21.42205, 39.826150),
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank5 ?Polyline(
                        points: [
                          LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4222, 39.82630),
                          LatLng(21.42216, 39.826180),
                          LatLng(21.42219, 39.825990),
                          LatLng(21.4221, 39.82582), // Adjusted coordinates to point towards tank 5
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank6 ?Polyline(
                        points: [
                          LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4222, 39.82630),
                          LatLng(21.42216, 39.826180),
                          LatLng(21.42219, 39.825990),
                          LatLng(21.4223, 39.82582),
                          LatLng(21.4225, 39.82575),
                          LatLng(21.4225, 39.82563),//7
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):    destination==tank7 ?Polyline(
                        points: [
                          LatLng(21.4222, 39.82664),
                          LatLng(21.4223, 39.82645),
                          LatLng(21.4222, 39.82630),
                          LatLng(21.42216, 39.826180),
                          LatLng(21.42219, 39.825990),
                          LatLng(21.4223, 39.82582),
                          LatLng(21.4225, 39.82575),
                          LatLng(21.4226, 39.82575),
                          LatLng(21.4227, 39.82575),
                          LatLng(21.4227, 39.82572), // Adjusted coordinate to make the last line half as tall
                        ],
                        color: Colors.blue, // Color of the route polyline
                        strokeWidth: 3,
                      ):Polyline(
                        points: [], // Empty points if condition is false
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
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
