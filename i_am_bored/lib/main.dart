import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/settings_screen.dart';
import './screens/about_app_screen.dart';
import './screens/donation_screen.dart';

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
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
