import 'package:flutter/material.dart';
import 'package:i_am_bored/models/bored_data.dart';
import 'package:i_am_bored/screens/list_detail_screen.dart';
import 'package:provider/provider.dart';

import '../provider/saved_list.dart';
import '../screens/saved_list_screen.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<SavedListScreen> {
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
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListDetailScreen(
                      receivedList: savedListItmes[i],
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: mediaQuery.height / 12,
                child: Text(
                  "${i + 1}. " + savedListItmes[i].activity,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  // textAlign: TextAlign.left,
                ),
              ),
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
      child: getTextWidgets(savedActivityList.savedItems, _mediaQuery, context),
    );
  }
}

// class BuildSavedList extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return(

//     );
//   }
// }