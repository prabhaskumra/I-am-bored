import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_am_bored/models/bored_data.dart';
import 'package:i_am_bored/screens/list_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/saved_list.dart';
import '../screens/saved_list_screen.dart';

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
      List<BoredData> savedListItmes, var mediaQuery, BuildContext context) {
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
                      index: i,
                    ),
                  ),
                );
              },
              // dense: true,
              // leading: Text("${i + 1}. "),
              subtitle: Text(
                  DateFormat /*('MM-dd-yyyy – kk:mm') // .yMMMMd('en_US')*/ .yMd()
                      .add_jm()
                      .format(savedListItmes[i].savedTime)),
              title: Text(
                "${i + 1}. " + savedListItmes[i].activity,
                style: TextStyle(
                    // fontSize: 18,
                    ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              // child: SizedBox(
              //   height: mediaQuery.height / 20,
              //   child: Text(
              //     "${i + 1}. " + savedListItmes[i].activity,
              //     softWrap: true,
              //     style: TextStyle(
              //       fontSize: 18,
              //     ),
              //     // textAlign: TextAlign.left,
              //   ),
              // ),
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

    return Container(
      child: savedActivityList.savedItems.isEmpty
          ? Center(
              child: Text("No saved items!"),
            )
          : getTextWidgets(savedActivityList.savedItems, _mediaQuery, context),
    );
  }
}
