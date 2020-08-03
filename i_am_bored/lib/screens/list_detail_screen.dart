import 'package:flutter/material.dart';
import '../models/bored_data.dart';

class ListDetailScreen extends StatelessWidget {
  static const routeName = '/list-detail';

  final BoredData receivedList;

  ListDetailScreen({
    this.receivedList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        // backgroundColor: Theme.of(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(40, 30),
            // top: Radius.circular(30),
          ),
        ),
        title: Text('List'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Card(
          elevation: 20,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              receivedList.activity,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
