import 'package:flutter/material.dart';

import '../models/variables.dart' as globals;

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // appBar: AppBar(
        //   title: Text('Settings'),
        //   elevation: 20,
        //   // backgroundColor: Theme.of(context),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.elliptical(40, 30),
        //     ),
        //   ),
        // ),
        child: Switch.adaptive(
            value: globals.darkMode,
            onChanged: (value) {
              setState(() {
                globals.darkMode = !globals.darkMode;
              });
            }));
  }
}
