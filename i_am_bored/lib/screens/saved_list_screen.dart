import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/saved_list.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<SavedListScreen> {
  @override
  Widget build(BuildContext context) {
    final savedActivityList = Provider.of<SavedList>(context);

    return Container(
      child: Center(
        child: Text("No Saved Activities!"),
        // child: ListView(
        //   children: <Widget>[Text("${savedActivityList.savedItems[0].activity}")],
        // ),
      ),
    );
  }
}
