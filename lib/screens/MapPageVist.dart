
import 'package:first_app/screens/SettingVistor.dart';
import 'package:first_app/screens/TankInfoVist.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/TankListVist.dart';
import '../generated/l10n.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class MapPageVist extends StatefulWidget {
  @override
  _MapPageVistState createState() => _MapPageVistState();
}

class _MapPageVistState extends State<MapPageVist> {
  List<Map<String, dynamic>> tankInfoList = [];
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
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
        title: Text(S.of(context).mapTittle),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: MapContent(),
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
                      icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapPageVist()),
                        );
                      },
                    ),),),
                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TankListVist()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPageVistor()),
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
}

class MapContent extends StatelessWidget {
  LatLng _userLocation = LatLng(21.4222, 39.82670); // Default location (0, 0)
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Tanks').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<Map<String, dynamic>> tankInfoList = snapshot.data!.docs.map<Map<String, dynamic>>((doc) => doc.data() as Map<String, dynamic>).toList();

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
              ],
            ),
          ],
        );
      },
    );
  }
}
