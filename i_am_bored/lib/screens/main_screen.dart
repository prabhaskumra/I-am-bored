import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import './home_screen.dart';
import './saved_list_screen.dart';
import './settings_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  var _homeSceen = true;
  var _savedListScreen = false;
  var _settingsScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Bored App"),
        toolbarHeight: kToolbarHeight / 1.2,
        // toolbarHeight: kToolbarHeight * 5,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(30, 30),
            // bottom: Radius.circular(50),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 20,
        curve: Curves.easeInBack,
        // containerHeight: 50,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          if (currentIndex == 0) {
            _homeSceen = true;
            _savedListScreen = _settingsScreen = false;
          } else if (currentIndex == 1) {
            _savedListScreen = true;
            _homeSceen = _settingsScreen = false;
          } else if (currentIndex == 2) {
            _settingsScreen = true;
            _homeSceen = _savedListScreen = false;
          }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Saved List'),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              'Settings',
            ),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: _homeSceen
          ? HomeScreen()
          : (_savedListScreen ? SavedListScreen() : SettingsScreen()),
    );
  }
}
