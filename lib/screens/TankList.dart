import 'package:flutter/material.dart';
import 'dart:math' as math;

class TankList extends StatefulWidget {
  @override
  _TankListState createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  String? selectedFilter;

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
      body: ClipPath(
       // clipper: CustomClipper(),
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
                5,
                    (index) => Container(
                  width: 330,
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tank ${index + 1}',
                        style: TextStyle(
                          color: Color(0xff004AAB),
                          fontSize: 18,
                        ),
                      ),
                    ],
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

// class CustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);
//     path.addRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTWH(30, 30, size.width - 60, size.height - 60),
//         Radius.circular(30),
//       ),
//     );
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }