import 'package:flutter/material.dart';
import 'package:suqia/screens/TankInfo.dart';
import 'package:suqia/screens/settingEmp.dart';
import 'package:suqia/screens/MapPage.dart';
import '../generated/l10n.dart';

class TankList extends StatefulWidget {
  @override
  _TankListState createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  String? selectedDistance;
  String? selectedTemperature;

  var Tanks = [
    ["19", "Empty", "2nd Floor", "Cold", "1.0 Km"],
    ["12", "Full", "1st Floor", "Warm", "0.1 Km"],
    ["08", "Full", "3rd Floor", "Cold", "2.0 Km"],
    ["07", "Empty", "3rd Floor", "Cold", "0.5 Km"],
    ["20", "Full", "2nd Floor", "Cold", "0.3 Km"],
    ["17", "Empty", "3rd Floor", "Warm", "1.3 Km"],
    ["13", "Full", "1st Floor", "Warm", "0.1 Km"],
    ["06", "Full", "2nd Floor", "Warm", "1.2 Km"],
    ["01", "Empty", "3rd Floor", "Cold", "1.5 Km"],
    ["22", "Full", "1st Floor", "Cold", "0.4 Km"],
  ];

  List<List<String>> filteredTanks = [];

  @override
  void initState() {
    super.initState();
    filteredTanks = List.from(Tanks);
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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: 390,
          height: 844,
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
                        builder: (context) => TankInfo(
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
                            "Assets/tank.png",
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(40), bottom: Radius.circular(40)),
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
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.opacity, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TankList()),
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
                              0xff0054bb), // Adjust the shadow color and opacity
                          spreadRadius:
                          50, // Adjust the spread radius to make the shadow wider
                          blurRadius:
                          2, // Adjust the blur radius for smoother edges
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, color: Colors.white, size: 40),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
