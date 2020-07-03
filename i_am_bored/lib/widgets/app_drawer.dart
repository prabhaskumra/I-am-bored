import 'package:flutter/material.dart';

import '../screens/about_app_screen.dart';
import '../screens/donation_screen.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(40, 30),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              // color: Colors.yellowAccent,
            ),
            title: Text('About App'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(AboutAppScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.fastfood,
            ),
            title: Text('Buy me a coffee!'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(DonationScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
