import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_am_bored/models/bored_data.dart';
import 'package:i_am_bored/screens/list_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/saved_list.dart';
import '../screens/saved_list_screen.dart';
import '../helpers/database_helper.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<SavedListScreen> {
  // SystemChannels

  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
    // SystemChannels
  }

  Widget getTextWidgets(
      // List<BoredData> savedListItmes, var mediaQuery, BuildContext context) {
      List<Map<String, dynamic>> savedListItmes,
      var mediaQuery,
      BuildContext context) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < savedListItmes.length; i++) {
      // print("I");
      // print(i);
      list.add(
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 10,
          child: Container(
            // width: 0,
            padding: EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                vibrate();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListDetailScreen(
                      receivedList: savedListItmes[i],
                      // index: i,
                    ),
                  ),
                );
              },
              subtitle: Text(savedListItmes[i][DatabaseHelper.savedTime]),
              title: Text(
                "${i + 1}. " + savedListItmes[i][DatabaseHelper.activity],
                style: TextStyle(
                    // fontSize: 18,
                    ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        // Divider(),

        // Divider(),
      );
    }
    return new ListView(
      padding: EdgeInsets.all(10),
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    final savedActivityList = Provider.of<SavedList>(context);
    savedActivityList.getDatabaseList();

    return Container(
      child: savedActivityList.databaseList.isEmpty
          ? Center(
              child: Text("No saved items!"),
              // child: CupertinoActivityIndicator(),
            )
          : getTextWidgets(
              savedActivityList.databaseList, _mediaQuery, context),
    );
  }
}
