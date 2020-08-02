import 'package:flutter/material.dart';

class SavedListScreen extends StatefulWidget {
  @override
  _SavedListScreenState createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<SavedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("No Saved Activities!"),
    ));
  }
}
