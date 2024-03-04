import 'package:flutter/material.dart';
import 'package:suqia/screens/TankInfo.dart';

class TankList extends StatefulWidget {
  @override
  _TankListState createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  String? selectedFilter;
  var Tanks = [
    ["19", "Empty", "2nd Floor", "Cold", "1.0 Km"],
    ["12", "Full", "1st Floor", "Hot", "0.1 Km"],
    ["08", "Full", "3rd Floor", "Cold", "2.0 Km"],
    ["07", "Empty", "3rd Floor", "Cold", "0.5 Km"],
    ["20", "Full", "2nd Floor", "Cold", "0.3 Km"],
    ["17", "Empty", "3rd Floor", "Hot", "1.3 Km"],
    ["13", "Full", "1st Floor", "Hot", "0.1 Km"],
    ["06", "Full", "2nd Floor", "Hot", "1.2 Km"],
    ["01", "Empty", "3rd Floor", "Cold", "1.5 Km"],
    ["22", "Full", "1st Floor", "Cold", "0.4 Km"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tank List'),
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
              DropdownButton<String>(
                value: selectedFilter,
                items: [
                  DropdownMenuItem(
                    child: Text('Distance'),
                    value: 'Distance',
                  ),
                  DropdownMenuItem(
                    child: Text('Temperature'),
                    value: 'Temperature',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value;
                  });
                },
              ),
              ...List.generate(
                Tanks.length,
                    (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TankInfo(),
                      ),
                    );
                  },
                  child: Container(
                    width: 330,
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F3),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/Tank1.png",
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          'Tank ${Tanks[index][0]}',
                          style: TextStyle(
                            color: Color(0xff004AAB),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          '${Tanks[index][4]}',
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
    );
  }
}
