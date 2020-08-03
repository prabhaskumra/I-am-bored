import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/bored_data.dart';

class ListDetailScreen extends StatefulWidget {
  static const routeName = '/list-detail';

  final BoredData receivedList;

  ListDetailScreen({
    this.receivedList,
  });

  @override
  _ListDetailScreenState createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  var linkisEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.receivedList.link == '')
      linkisEmpty = true;
    else
      linkisEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    var roundRectangularBorder = RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20),
    );

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
        // height: _mediaQuery.height / 2,
        child: Column(
          children: [
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      widget.receivedList.activity,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                        // color: Theme.of(context).primaryColor,
                        ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Text("Type"),
                            Text(widget.receivedList.type),
                          ],
                        ),
                        buildTableRowDivider(),
                        TableRow(
                          children: [
                            Text("Participants"),
                            Text(widget.receivedList.participants.toString()),
                          ],
                        ),
                        buildTableRowDivider(),
                        TableRow(
                          children: [
                            Text("Price"),
                            Text(widget.receivedList.price.toString()),
                          ],
                        ),
                        buildTableRowDivider(),
                        TableRow(
                          children: [
                            Text("Accessibility"),
                            Text(widget.receivedList.accessibility.toString()),
                          ],
                        ),
                        buildTableRowDivider(),
                        TableRow(
                          children: [
                            Text("Link"),
                            SelectableLinkify(
                              text: linkisEmpty
                                  ? 'None available'
                                  : widget.receivedList.link,
                              onTap: () async {
                                if (await canLaunch(widget.receivedList.link))
                                  launch(widget.receivedList.link);
                              },
                              style: TextStyle(
                                  // fontSize: fontsize / 1.2,
                                  ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        buildTableRowDivider(),
                        TableRow(
                          children: [
                            Text("Time saved"),
                            Text(DateTime.now().toString()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text('Remove from the list'),
                  onPressed: () {},
                  shape: roundRectangularBorder,
                  color: Colors.white,
                ),
                RaisedButton(
                  child: Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  shape: roundRectangularBorder,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TableRow buildTableRowDivider() {
    return TableRow(
      children: [
        Divider(),
        Divider(),
      ],
    );
  }
}
