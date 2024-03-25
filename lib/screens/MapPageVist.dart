import 'dart:async';
import 'package:first_app/screens/SettingVistor.dart';
import 'package:first_app/screens/TankInfoVist.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/TankListVist.dart';
import 'package:first_app/screens/settingEmp.dart';
import '../generated/l10n.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:first_app/screens/TankInfoEmp.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

class MapPageVist extends StatefulWidget {
  @override
  _MapPageVistState createState() => _MapPageVistState();
}

class _MapPageVistState extends State<MapPageVist> {
  LatLng _userLocation = LatLng(21.4222, 39.82670); // Default location (0, 0)
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

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
                  Marker(
                    point: LatLng(21.4225, 39.8266),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['2', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.local_drink, // Using LocalDrink icon
                        size: 30,
                        color: Colors.lightBlueAccent, // You can adjust the color as needed
                      ),
                    ),
                  ),

                  Marker(
                    point: LatLng(21.4220, 39.82615),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['4', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      },child: Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4221, 39.82577),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['5', 'Full', 'Floor1', 'Warm'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),

                  Marker(
                    point: LatLng(21.4225, 39.82558),
                    width: 30,
                    height: 91,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['6', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      },child: Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),

                  Marker(
                    point: LatLng(21.4227, 39.82567),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['7', 'Full', 'Floor1', 'Warm'],
                            ),
                          ),
                        );
                      },child: Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4230, 39.82598),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['9', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),

                  Marker(
                    point: LatLng(21.4229, 39.82577),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['8', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4230, 39.82636),
                    width: 80,
                    height: 80,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['10', 'Full', 'Floor1', 'Warm'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4228, 39.82652),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['11', 'Full', 'Floor1', 'Cold'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4229, 39.82664),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfoVist(
                              TankInfo: ['12', 'Full', 'Floor1', 'Warm'],
                            ),
                          ),
                        );
                      }, child:Icon(
                      Icons.local_drink, // Using LocalDrink icon
                      size: 30,
                      color: Colors.lightBlueAccent, // You can adjust the color as needed
                    ),
                    ),),

                ],
              ),
            ],
          ),
        ],
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
                    child:  IconButton(
                      icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MapPageVist()));
                      },
                    ),
                  ),
                ),


                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => TankListVist()));
                  },
                ),

                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPageVistor()));
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