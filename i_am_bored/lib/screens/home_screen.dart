import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';
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
        // backgroundColor: Theme.of(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(40, 30),
            // top: Radius.circular(30),
          ),
        ),
        title: Text('The Bored App'),
      ),
      drawer: AppDrawer(),
      // backgroundColor: Theme.of(context).buttonColor);
    );
  }
}
