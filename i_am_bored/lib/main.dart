import 'package:flutter/material.dart';
// import 'dart:io';

import './screens/home_screen.dart';
import './screens/settings_screen.dart';
import './screens/about_app_screen.dart';
import './screens/donation_screen.dart';
import './models/variables.dart' as globals;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'SansPro',
        brightness: Brightness.light,
        textTheme: TextTheme(
          caption: TextStyle(
            fontSize: 20.0,
          ),
        ),
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
      ),
      home: HomeScreen(),
      routes: {
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        AboutAppScreen.routeName: (ctx) => AboutAppScreen(),
        DonationScreen.routeName: (ctx) => DonationScreen(),
      },
    );
  }
}
