import 'package:flutter/material.dart';

class ListViewButtons extends StatelessWidget {
  const ListViewButtons({
    Key key,
    @required this.fontsize,
  }) : super(key: key);

  final double fontsize;

  @override
  Widget build(BuildContext context) {
    // enum selectedButton{
    //   activity,

    // }

    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10),
    );

    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: RaisedButton.icon(
            icon: Icon(Icons.ac_unit),
            shape: roundedRectangleBorder,
            onPressed: () {},
            label: Text(
              "Activity",
              style: TextStyle(fontSize: fontsize),
            ),
            color: Colors.white,
          ),
        ),
        // Divider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: RaisedButton.icon(
            shape: roundedRectangleBorder,
            icon: Icon(Icons.people),
            onPressed: () {},
            label: Text(
              "Pariticipants",
              style: TextStyle(fontSize: fontsize),
            ),
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: RaisedButton.icon(
            icon: Icon(Icons.attach_money),
            shape: roundedRectangleBorder,
            onPressed: () {},
            label: Text(
              "Price",
              style: TextStyle(fontSize: fontsize),
            ),
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: RaisedButton.icon(
            icon: Icon(Icons.ac_unit),
            shape: roundedRectangleBorder,
            onPressed: () {},
            label: Text(
              "Accessibility",
              style: TextStyle(fontSize: fontsize),
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
