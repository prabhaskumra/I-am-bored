import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/foundation.dart';

import '../helpers/database_helper.dart';
import '../models/bored_data.dart';
import '../provider/saved_list.dart';

class ListDetailScreen extends StatefulWidget {
  static const routeName = '/list-detail';

  final Map<String, dynamic> receivedList;
  final int index;

  ListDetailScreen({
    this.receivedList,
    this.index,
  });

  @override
  _ListDetailScreenState createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  var linkisEmpty = false;
  var _myTextController;
  var doneColor = false;

  // @override
  void initState() {
    _myTextController = TextEditingController()
      ..text = widget.receivedList[DatabaseHelper.notes];
    if (widget.receivedList[DatabaseHelper.link] == '')
      linkisEmpty = true;
    else
      linkisEmpty = false;
  }

  // SystemChannels
  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
    // SystemChannels
  }

  void updateDatabase() async {
    Map<String, dynamic> updatedNode = {
      DatabaseHelper.columnId: widget.receivedList[DatabaseHelper.columnId],
      DatabaseHelper.activity: widget.receivedList[DatabaseHelper.activity],
      DatabaseHelper.type: widget.receivedList[DatabaseHelper.type],
      DatabaseHelper.participants:
          widget.receivedList[DatabaseHelper.participants],
      DatabaseHelper.price: widget.receivedList[DatabaseHelper.price],
      DatabaseHelper.link: widget.receivedList[DatabaseHelper.link],
      DatabaseHelper.key: widget.receivedList[DatabaseHelper.key],
      DatabaseHelper.accessibility:
          widget.receivedList[DatabaseHelper.accessibility],
      DatabaseHelper.isFavourite:
          widget.receivedList[DatabaseHelper.isFavourite],
      DatabaseHelper.savedTime: widget.receivedList[DatabaseHelper.savedTime],
      DatabaseHelper.notes: _myTextController.text,
    };

    // widget.receivedList[DatabaseHelper.notes] =
    //     _myTextController.text;
    int i = await DatabaseHelper.instance.update(updatedNode);
    print(i);
  }

  @override
  Widget build(BuildContext context) {
    // Event event = Event(
    //   title: widget.receivedList[DatabaseHelper.activity],
    //   // description: widget.receivedList[DatabaseHelper.link] +
    //   //     '\n' +
    //   //     widget.receivedList[DatabaseHelper.notes],
    //   description: _myTextController.text,
    //   // location: 'Flutter app',
    //   startDate: DateTime.now(),
    //   endDate: DateTime.now().add(Duration(days: 1)),
    //   allDay: false,
    // );

    var _mediaQuery = MediaQuery.of(context).size;
    final indexData = Provider.of<SavedList>(context);
    // notifyListers();

    var roundRectangularBorder = RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20),
    );

// return ChangeNotifierProvider(
//       create: (context) => SavedList(),

    return ChangeNotifierProvider(
      create: (context) => SavedList(),
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(
        //     title: Text('ajjdsfdjjf'),
        //     icon: Icon(
        //       Icons.delete_forever,
        //     ),
        //   ),
        //   BottomNavigationBarItem(
        //     title: Text('ajjdsfdjjf'),
        //     icon: Icon(
        //       Icons.delete_forever,
        //     ),
        //   ),
        // ]),

        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add this activity to calendar',
            child: Icon(Icons.calendar_today),
            onPressed: () {
              String combined;
              if (!linkisEmpty) {
                combined =
                    '${widget.receivedList[DatabaseHelper.link]}\n${_myTextController.text}';
              } else {
                combined = '${_myTextController.text}';
              }

              Event event = Event(
                title: widget.receivedList[DatabaseHelper.activity],
                description: combined,
                // description: _myTextController.text,
                // location: 'Flutter app',
                startDate: DateTime.now(),
                endDate: DateTime.now().add(Duration(days: 1)),
                allDay: false,
              );
              Add2Calendar.addEvent2Cal(event);
              // .then((success) {
              //   scaffoldState.currentState.showSnackBar(
              //       SnackBar(content: Text(success ? 'Success' : 'Error')));
              // });
            }),
        appBar: AppBar(
          // actions: [
          //   FlatButton(
          //     child: Icon(
          //       Icons.calendar_today,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   )
          // ],
          elevation: 20,
          toolbarHeight: kToolbarHeight / 1.3,
          // backgroundColor: Theme.of(context),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     // bottom: Radius.elliptical(30, 30),
          //     top: Radius.circular(30),
          //     bottom: Radius.circular(30),

          //     // top: Radius.circular(30),
          //   ),
          // ),
          title: Text(widget.receivedList[DatabaseHelper.activity]),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            // height: _mediaQuery.height / 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        SelectableText(
                          widget.receivedList[DatabaseHelper.activity],
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
                                Text(widget.receivedList[DatabaseHelper.type]),
                              ],
                            ),
                            buildTableRowDivider(),
                            TableRow(
                              children: [
                                Text("Participants"),
                                Text(widget
                                    .receivedList[DatabaseHelper.participants]
                                    .toString()),
                              ],
                            ),
                            buildTableRowDivider(),
                            TableRow(
                              children: [
                                Text("Price"),
                                Text(
                                    widget.receivedList[DatabaseHelper.price] ==
                                            0.0
                                        ? "Affordable"
                                        : "not Affortdable"
                                    // .toString(),
                                    ),
                              ],
                            ),
                            buildTableRowDivider(),
                            TableRow(
                              children: [
                                Text("Accessibility"),
                                Text(widget
                                    .receivedList[DatabaseHelper.accessibility]
                                    .toString()),
                              ],
                            ),
                            buildTableRowDivider(),
                            TableRow(
                              children: [
                                Text("Link"),
                                SelectableLinkify(
                                  text: linkisEmpty
                                      ? 'None available'
                                      : widget
                                          .receivedList[DatabaseHelper.link],
                                  onTap: () async {
                                    if (await canLaunch(widget
                                        .receivedList[DatabaseHelper.link]))
                                      launch(widget
                                          .receivedList[DatabaseHelper.link]);
                                  },
                                  style: TextStyle(
                                      // fontSize: fontsize / 1.2,
                                      ),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        TextFormField(
                          // initialValue: widget.receivedList[DatabaseHelper.notes],
                          // initialValue: _myTextController.text,
                          controller: _myTextController,
                          decoration: new InputDecoration(
                            labelText: 'Enter notes',
                            alignLabelWithHint: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          onTap: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus &&
                                currentFocus.focusedChild != null) {
                              currentFocus.focusedChild.unfocus();

                              updateDatabase();
                            }
                          },
                          // onSubmitted: ,
                          // onSubmitted: (_) async {
                          //   print("readinghere");
                          //   widget.receivedList[DatabaseHelper.notes] = value;
                          //   int i = await DatabaseHelper.instance
                          //       .update(widget.receivedList);
                          //   print(i);
                          // },
                          // onFieldSubmitted: (value) => print("hello heelo"),
                          onEditingComplete: () => print("Editing omcplee"),
                          // onEditingComplete: () async {},
                          // FocusScope.of(context).requestFocus(FocusNode()),
                          keyboardType: TextInputType.multiline,
                          // autofocus: true,
                          maxLines: 5,
                          toolbarOptions: ToolbarOptions(
                            copy: true,
                            paste: true,
                            cut: true,
                            selectAll: true,
                          ),
                          // expands: true,
                        ),

                        SizedBox(height: 20),

                        ///
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text(
                        'Remove item',
                        // style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        vibrate();
                        // indexData.removeItem(widget.index);
                        // Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Platform.isIOS
                                ? CupertinoAlertDialog(
                                    title: Text(
                                      // "Remove this item from the list?",
                                      "Remove this item?",
                                    ),
                                    content: Text(
                                        "Item will be deleted from saved list"),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          // indexData.removeItem(widget.index);
                                          indexData.removeItem(
                                              widget.receivedList[
                                                  DatabaseHelper.columnId]);
                                          // notifylistners():
                                          // notifyListeners();
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  )
                                : AlertDialog(
                                    title: Text("Remove this item?"),
                                    content: Text(
                                        "Item will be deleted from saved list"),
                                    actions: [
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          // indexData.removeItem(widget.index);
                                          print(
                                              'column id is ${widget.receivedList[DatabaseHelper.columnId]}');
                                          indexData.removeItem(
                                              widget.receivedList[
                                                  DatabaseHelper.columnId]);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          // DismissAction(context);
                                          // indexData.removeItem(widget.index);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                          },
                        );
                      },
                      shape: roundRectangularBorder,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                    RaisedButton(
                      child: Text('Done'),
                      onPressed: () {
                        vibrate();
                        // updateDatabase();
                        Navigator.of(context).pop();
                        // print(widget.receivedList[DatabaseHelper.participants]);
                      },
                      shape: roundRectangularBorder,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ],
                ),
                // Divider(
                //   thickness: 10,
                //   // color: Theme.of(context).primaryColor,
                // ),
                // SizedBox(height: 20),

                // TextField(
                //   decoration: new InputDecoration(
                //     labelText: "Enter Notes",
                //     alignLabelWithHint: true,
                //     fillColor: Colors.white,
                //     border: new OutlineInputBorder(
                //       borderRadius: new BorderRadius.circular(20.0),
                //       borderSide: new BorderSide(),
                //     ),
                //   ),
                //   keyboardType: TextInputType.text,
                //   // autofocus: true,
                //   maxLines: 10,
                //   toolbarOptions: ToolbarOptions(
                //     copy: true,
                //     paste: true,
                //     cut: true,
                //     selectAll: true,
                //   ),
                //   // expands: true,
                // ),
                // SizedBox(height: 20),
              ],
            ),
          ),
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
