import 'package:flutter/material.dart';

class CircleShape extends StatefulWidget {
  @override
  _CircleShapeState createState() => _CircleShapeState();
}

class _CircleShapeState extends State<CircleShape> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(130.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        border: Border.all(
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
