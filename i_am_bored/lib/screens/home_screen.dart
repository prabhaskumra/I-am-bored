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
        title: Text(
          'The Bored App',
          // style: TextStyle(),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          border: Border.all(
            color: Colors.red,
            width: 10,
          ),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "How are you feeling Today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      // body: CircleShape(),
    );
  }
}
