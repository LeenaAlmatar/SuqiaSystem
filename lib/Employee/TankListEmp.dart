import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Employee/TankInfoEmp.dart';
import 'package:first_app/Employee/settingEmp.dart';
import 'package:first_app/Employee/MapPageEmp.dart';
import '../generated/l10n.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart'; // Firebase Realtime Database

class TankListEmp extends StatefulWidget {
  @override
  _TankListEmpState createState() => _TankListEmpState();
}

class _TankListEmpState extends State<TankListEmp> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseDatabase _realtimeDb = FirebaseDatabase.instance; // Firebase Realtime Database instance
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? selectedDistance;
  String? selectedTemperature;

  List<List<String>> Tanks = [];
  List<List<String>> filteredTanks = [];

  @override
  void initState() {
    super.initState();
    _fetchTanksFromFirestore();
    _subscribeToTankStatusChanges();
    filteredTanks = List.from(Tanks);
  }




 Future<void> _fetchTanksFromFirestore() async {
    try {
      Tanks.clear();
      List<List<String>> tempTanks = [];
      var snapshot = await _realtimeDb.reference().child('Tank').once();
      var data = snapshot.snapshot.value;
      var Floor= snapshot.snapshot.child('Floor').value;
      var Number= snapshot.snapshot.child('Number').value;
      var temperatureC= snapshot.snapshot.child('temperatureC').value;
      var waterLevelPercentage= snapshot.snapshot.child('waterLevelPercentage').value;
      var distance= snapshot.snapshot.child('distance').value;
      if (temperatureC is num) {
        // Determine if the temperature is "Cold" or "Warm" based on the value
        var temperatureLabel = temperatureC <= 20 ? 'Cold' : 'Warm';
        if (waterLevelPercentage is num) {
          // Determine if the temperature is "Cold" or "Warm" based on the value
          var waterLevelPercentageLabel = waterLevelPercentage <= 10 ? 'Empty' : 'Full';

          List<String> tankData = [
            Number.toString(),
            waterLevelPercentageLabel ,
            Floor.toString(),
            temperatureLabel ,
            distance.toString() ,
          ];

          tempTanks.add(tankData);}}

      QuerySnapshot querySnapshot = await _db.collection('Tanks').get();
      querySnapshot.docs.forEach((doc) {
        List<String> tankData = [
          doc['Number'].toString(),
          doc['Status'],
          doc['Floor'],
          doc['Temperature'],
          doc['distance']
        ];
        tempTanks.add(tankData);
      });
      tempTanks.sort((a, b) => int.parse(a[0]).compareTo(int.parse(b[0])));
      setState(() {
        Tanks = tempTanks;
        filteredTanks = List.from(Tanks);
      });
    } catch (e) {
      print('Error fetching tanks from Firestore: $e');
    }
  }


  void _subscribeToTankStatusChanges() {
    _db.collection('Tanks').snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.modified) {
          Map<String, dynamic> tankData = change.doc.data() as Map<String, dynamic>;
          if (tankData['Status'] == 'Empty') {
            _showTankStatusNotification(tankData['Number'].toString());
          }
        }
      });
    });
  }

  void _showTankStatusNotification(String tankNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).tankStatusChanged),
          content: Text(S.of(context).tank + " " + tankNumber + " " + S.of(context).isnowemptyPleaserefillit),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void sortTanksByNumber() {
    setState(() {
      Tanks.sort((a, b) {
        try {
          // Parse the first element to an integer
          int numA = int.parse(a[0]);
          int numB = int.parse(b[0]);

          // Sort in ascending order
          return numA.compareTo(numB);
        } catch (e) {
          // Handle any parsing errors
          print("Error parsing tank number: $e");
          return 0; // Keep the order unchanged in case of error
        }
      });

      // Update filteredTanks after sorting, if needed
      filteredTanks = List.from(Tanks);

      // Output the sorted Tanks list for verification
      print("Tanks after sorting by number:");
      Tanks.forEach((tank) => print(tank));
    });
  }





  void filterTanks() {
    List<List<String>> tempFilteredTanks = List.from(Tanks);

    if (selectedDistance != null) {
      tempFilteredTanks.sort((a, b) {
        if (selectedDistance == 'Nearest') {
          return a[4].compareTo(b[4]);
        } else {
          return b[4].compareTo(a[4]);
        }
      });
    }

    if (selectedTemperature != null) {
      tempFilteredTanks.removeWhere((tank) => tank[3] != selectedTemperature);
    }

    setState(() {
      filteredTanks = List.from(tempFilteredTanks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tListTitle),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: ScrollController(),
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            width: 390,
            height: 1000,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: selectedDistance,
                      items: [
                        DropdownMenuItem(
                          child: Text(S.of(context).nearest),
                          value: 'Nearest',
                        ),
                        DropdownMenuItem(
                          child: Text(S.of(context).farthest),
                          value: 'Farthest',
                        ),
                      ],
                      hint: Text(S.of(context).distance),
                      onChanged: (value) {
                        setState(() {
                          selectedDistance = value;
                          filterTanks();
                        });
                      },
                    ),
                    DropdownButton<String>(
                      value: selectedTemperature,
                      items: [
                        DropdownMenuItem(
                          child: Text(S.of(context).cold),
                          value: 'Cold',
                        ),
                        DropdownMenuItem(
                          child: Text(S.of(context).warm),
                          value: 'Warm',
                        ),
                      ],
                      hint: Text(S.of(context).temperature),
                      onChanged: (value) {
                        setState(() {
                          selectedTemperature = value;
                          filterTanks();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          selectedDistance = null;
                          selectedTemperature = null;
                          filterTanks();
                        });
                      },
                    ),
                  ],
                ),
                ...List.generate(
                  filteredTanks.length,
                      (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TankInfoEmp(
                            tankInfo: filteredTanks[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F2F3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              filteredTanks[index][1] == 'Full'
                                  ? "assets/tank.png"
                                  : "assets/Gtank.png",
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            S.of(context).tank + ' ${filteredTanks[index][0]}',
                            style: TextStyle(
                              color: Color(0xff004AAB),
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            '${filteredTanks[index][4]}',
                            style: TextStyle(
                              color: Color(0xff004AAB),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).toList(),
              ],
            ),
          ),
        ),
      ),
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
                IconButton(
                  icon: Icon(Icons.location_on, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPageEmp()),
                    );
                  },
                ),
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
                      icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TankListEmp()),
                        );
                      },
                    ),),),
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
}