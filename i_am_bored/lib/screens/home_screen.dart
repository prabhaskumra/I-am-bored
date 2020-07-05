import 'package:flutter/material.dart';

import '../widgets/circle_shape.dart';
import '../widgets/app_drawer.dart';
import '../models/bored_https_call.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fontsize = 25.0;

  BoredHttpsCall callClass;

  Future<void> _fetchData() async {
    await BoredHttpsCall().callByActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight / 1.2,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(30, 30),
          ),
        ),
        title: Text(
          'The Bored App',
          style: TextStyle(
            fontSize: fontsize,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          // border: Border.all(
          //   color: Colors.red,
          //   width: 10,
          // ),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "How are you feeling Today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: fontsize,
              ),
            ),
            RaisedButton(
              onPressed: _fetchData,
              // onPressed: callClass.callByActivity,
            )
          ],
        ),
      ),
      // body: CircleShape(),
    );
  }
}
