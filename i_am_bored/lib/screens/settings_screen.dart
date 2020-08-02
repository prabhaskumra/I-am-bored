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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.bookmark_border,
                ),
              ),
              Text("Saved List"),
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.brightness_2,
                ),
              ),
              Text("Dark Mode"),
              Switch.adaptive(
                  value: globals.darkMode,
                  onChanged: (value) {
                    setState(() {
                      globals.darkMode = !globals.darkMode;
                    });
                  }),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.info_outline,
                ),
              ),
              Text("About App"),
              FlatButton(
                clipBehavior: Clip.hardEdge,
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(Icons.share),
              ),
              Text("Tell a friend!"),
              FlatButton(
                clipBehavior: Clip.hardEdge,
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CircleAvatar(
              //   child: Icon(
              //     Icons.info_outline,
              //   ),
              // ),
              // Text("Color Scheme"),
              Container(
                // color: Colors.red,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  // foregroundColor: Colors.green,
                  child: FlatButton(
                    child: null,
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  // foregroundColor: Colors.green,
                  child: FlatButton(
                    child: null,
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  // foregroundColor: Colors.green,
                  child: FlatButton(
                    child: null,
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  // foregroundColor: Colors.green,
                  child: FlatButton(
                    child: null,
                    onPressed: () {},
                  ),
                ),
              ),
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
}
