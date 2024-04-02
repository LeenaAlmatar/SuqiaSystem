import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:first_app/screens/TankInfoVist.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class DierPageVist extends StatefulWidget {
  final LatLng destination;
  DierPageVist({required this.destination});
  @override
  _DierPageState createState() => _DierPageState(destination: destination);
}

class _DierPageState extends State<DierPageVist > {
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

  // Function to fetch tank information from Firestore
  Future<void> fetchTankInfo() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tanks')
        .where('Status', isEqualTo: 'Full') // Filter by status 'Full'
        .get();

    setState(() {
      tankInfoList = snapshot.docs.map<Map<String, dynamic>>((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    fetchTankInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0000CC)),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(S.of(context).mapTittle),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xFF0000CC),
          fontSize: 24,
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(

            options: MapOptions(
              center: _userLocation ?? LatLng(21.4225, 39.8262),
              zoom: 18.0, // Adjust the zoom level as needed

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
                  for (var tankInfo in tankInfoList)
                    Marker(
                      point: LatLng(  (tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 80,
                      height: 80,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },
                        child: tankInfo['Status'] == 'Full'
                            ? Icon(
                          Icons.local_drink,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        )
                            : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),
                    ),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng( (tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },
                        child: tankInfo['Status'] == 'Full'
                            ? Icon(
                          Icons.local_drink,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        )
                            : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),
                    ),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 80,
                      height: 80,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)
                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)
                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 91,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },
                        child: tankInfo['Status'] == 'Full'
                            ? Icon(
                          Icons.local_drink,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        )
                            : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 80,
                      height: 80,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },  child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),

                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },   child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
                  for (var tankInfo in tankInfoList)

                    Marker(
                      point: LatLng((tankInfo['Latitude'] ?? 0.0).toDouble(), // Convert to double and handle null
                        (tankInfo['Longitude'] ?? 0.0).toDouble(),
                      ),
                      width: 30,
                      height: 90,
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TankInfoVist(
                                TankInfo: [tankInfo['Number'].toString(), tankInfo['Status'], tankInfo['Floor'], tankInfo['Temperature']],
                              ),
                            ),
                          );
                        },child: tankInfo['Status'] == 'Full'
                          ? Icon(
                        Icons.local_drink,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      )
                          : SizedBox.shrink(), // Hide the marker if status is not 'Full
                      ),),
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
      ),
    );
  }
}