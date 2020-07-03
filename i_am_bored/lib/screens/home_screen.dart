import 'package:flutter/material.dart';

import '../widgets/circle_shape.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(40, 30),
          ),
        ),
        title: Text('The Bored App'),
      ),
      drawer: AppDrawer(),
      // body: Container(
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.red,
      //       width: 10,
      //     ),
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      // ),
      body: CircleShape(),
    );
  }
}
