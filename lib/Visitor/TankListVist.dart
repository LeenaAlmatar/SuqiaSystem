import 'package:first_app/Visitor/MapPageVist.dart';
import 'package:first_app/Visitor/SettingVistor.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Visitor/TankInfoVist.dart';
import '../generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Cloud Firestore
import 'package:firebase_database/firebase_database.dart';

class TankListVist extends StatefulWidget {
  @override
  _TankListVistState createState() => _TankListVistState();
}

class _TankListVistState extends State<TankListVist> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseDatabase _realtimeDb = FirebaseDatabase.instance;
  String? selectedDistance;
  String? selectedTemperature;

  var Tanks = [];

  List<List<String>> filteredTanks = [];

  @override
  void initState() {
    super.initState();
    _fetchTanks();
    filteredTanks = List.from(Tanks);
  }
  Future<void> _fetchTanks() async {
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
          if(waterLevelPercentageLabel=='Full'){

          List<String> tankData = [
            Number.toString(),
            waterLevelPercentageLabel ,
            Floor.toString(),
            temperatureLabel ,
            distance.toString() ,
          ];

          tempTanks.add(tankData);}}}
      QuerySnapshot querySnapshot = await _db.collection('Tanks').get();
      querySnapshot.docs.forEach((doc) {
        // Check if the tank status is 'Full' before adding it to the list
        if (doc['Status'] == 'Full') {
          List<String> tankData = [
            doc['Number'].toString(),
            doc['Status'],
            doc['Floor'],
            doc['Temperature'],
            doc['distance']
          ];
          tempTanks.add(tankData);
        }
      });
      tempTanks.sort((a, b) => int.parse(a[0]).compareTo(int.parse(b[0])));
      setState(() {
        Tanks = tempTanks;
        filteredTanks = List.from(Tanks);
      });
    } catch (e) {
      print('Error fetching tanks: $e');
    }
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          builder: (context) => TankInfoVist(
                            TankInfo: filteredTanks[index],
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
                            child:  Image.asset(
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
                      MaterialPageRoute(builder: (context) => MapPageVist()),
                    );
                  },
                ),
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
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                            0xff0054bb,
                          ), // Adjust the shadow color and opacity
                          spreadRadius:
                          50, // Adjust the spread radius to make the shadow wider
                          blurRadius:2, // Adjust the blur radius for smoother edges
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TankListVist()),
                        );
                      },
                    ),
                  ),
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
