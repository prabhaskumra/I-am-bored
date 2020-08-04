import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/variables.dart' as globals;
import '../provider/theme_data.dart';
import '../screens/about_app_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeData = Provider.of<CustomThemeData>(context);

    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );
    return Container(
      // decoration: boxDecoration,
      padding: EdgeInsets.all(10),
      child: ListView(
        // shrinkWrap: ,
        children: [
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("About App!"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AboutAppScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Tell a friend!"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCircleAvatarColor(themeData, Colors.teal),
              buildCircleAvatarColor(themeData, Colors.blueGrey),
              buildCircleAvatarColor(themeData, Colors.red),
              buildCircleAvatarColor(themeData, Colors.green),
            ],
          ),
          Divider(),
          Text(
            "Version: 1.0.0\n All Rights Reserved",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatarColor(CustomThemeData themeData, var color) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: color,
      child: InkWell(
        onTap: () {
          themeData.changeColor(color);
        },
      ),
    );
  }
}
