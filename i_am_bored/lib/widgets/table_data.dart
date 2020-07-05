import 'package:flutter/material.dart';

import '../models/bored_https_call.dart';
import '../models/bored_data.dart';

class TableData extends StatelessWidget {
  const TableData({
    Key key,
    @required this.fontsize,
  }) : super(key: key);

  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          // color: Colors.green,
          // width: 10,
          ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          children: [
            Text(
              "How are you feeling today?",
              style: TextStyle(fontSize: fontsize),
              textAlign: TextAlign.center,
            ),
            Text("Hello"),
          ],
        ),
        TableRow(children: [
          Text(
            "second row!",
            style: TextStyle(
              fontSize: fontsize,
            ),
            textAlign: TextAlign.center,
          ),
          Text('hee')
        ])
      ],
    );
  }
}
