import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:suqia/screens/TankInfo.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';


class DierPage extends StatefulWidget {
  final LatLng destination;
  DierPage({required this.destination});
  @override
  _DierPageState createState() => _DierPageState(destination: destination);
}

class _DierPageState extends State<DierPage> {
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
        title: Text('Map'),
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
                  Marker(
                    point: LatLng(21.4225, 39.82674),
                    width: 80,
                    height: 80,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfo(
                              tankInfo: ['1', 'Empty', 'Floor1', '-'],
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.local_drink_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
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
                            builder: (context) => TankInfo(
                              tankInfo: ['2', 'Full', 'Floor1', 'Cold'],
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
                    point: LatLng(21.4221, 39.82648),
                    width: 80,
                    height: 80,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfo(
                              tankInfo: ['3', 'Empty', 'Floor1', '-'],
                            ),
                          ),
                        );
                      }, child: Icon(
                      Icons.local_drink_outlined, // Using LocalDrink icon
                      size: 30,
                      color: Colors.grey, // You can adjust the color as needed

                    ),
                    ),),
                  Marker(
                    point: LatLng(21.4220, 39.82615),
                    width: 30,
                    height: 90,
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TankInfo(
                              tankInfo: ['4', 'Full', 'Floor1', 'Cold'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['5', 'Full', 'Floor1', 'Warm'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['6', 'Full', 'Floor1', 'Cold'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['7', 'Full', 'Floor1', 'Warm'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['9', 'Full', 'Floor1', 'Cold'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['8', 'Full', 'Floor1', 'Cold'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['10', 'Full', 'Floor1', 'Warm'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['11', 'Full', 'Floor1', 'Cold'],
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
                            builder: (context) => TankInfo(
                              tankInfo: ['12', 'Full', 'Floor1', 'Warm'],
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