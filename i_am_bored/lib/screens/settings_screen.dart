import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/theme_data.dart';
import '../screens/about_app_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // SystemChannels

  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
    // SystemChannels
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Provider.of<CustomThemeData>(context);
    var _mediaQuery = MediaQuery.of(context).size;

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
              // color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              // vibrate();
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
              // color: Theme.of(context).primaryColor,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Help us out!"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              // color: Theme.of(context).primaryColor,
            ),
            onTap: () {},
          ),
          Divider(),
          Card(
            color: themeData.themeColor,
            elevation: 25,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: _mediaQuery.height * .20,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCircleAvatarColor(themeData, Colors.teal),
                  buildCircleAvatarColor(themeData, Colors.blueGrey),
                  buildCircleAvatarColor(themeData, Colors.red),
                  buildCircleAvatarColor(themeData, Colors.green),
                ],
              ),
            ),
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

  Container buildCircleAvatarColor(CustomThemeData themeData, var color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
      ),
      child: CircleAvatar(
        radius: 23,
        backgroundColor: color,
        child: InkWell(
          // borderRadius: BorderRadius.all(color),
          onTap: () {
            vibrate();
            themeData.changeColor(color);
          },
        ),
      ),
    );
  }
}

// onTap: () {
// vibrate();
// themeData.changeColor(color);
