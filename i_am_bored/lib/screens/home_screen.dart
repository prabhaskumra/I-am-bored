import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/circle_shape.dart';
import '../widgets/app_drawer.dart';
import '../models/bored_https_call.dart';
import '../widgets/table_data.dart';
import '../models/bored_data.dart';
import '../widgets/list_view_buttons.dart';
import '../widgets/gridview_buttons.dart';
import '../provider/saved_list.dart';
import '../models/variables.dart' as globals;
import '../helpers/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fontsize = 22.0;

  BoredHttpsCall callClass;
  BoredData receivedData;
  bool firstTime = true;
  var _isLoading = false;
  String callKey = 'byActivity';
  double callValue;
  var _isStar = false;
  int currentIndex = 0;
  int columnIdcreated;

  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
    // SystemChannels
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    BoredData value;
    receivedData =
        await BoredHttpsCall().callByActivity(value, callKey, callValue);
    _isStar = receivedData.isFavourite;
    setState(() {
      firstTime = false;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedActivityList = Provider.of<SavedList>(context);
    // _isStar = receivedData.isFavourite;

    var mediaQuery = MediaQuery.of(context);
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    return ChangeNotifierProvider(
      create: (context) => SavedList(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.blue[50],
          // color: Colors.blue,
          // color: Theme.of(context).backgroundColor,
          color: Theme.of(context).bottomAppBarColor,
          border: Border.all(
            color: Colors.white10,
            width: 5,
          ),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mediaQuery.size.height * .30,
              //     : double.infinity,
              // decoration: boxDecoration,
              child: Card(
                // borderOnForeground: mounted,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Theme.of(context).primaryColorDark,
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: (mediaQuery.size.height * .30) / 1.5,
                      // decoration: boxDecoration,
                      child: SingleChildScrollView(
                        child: firstTime
                            // ? Text("Start Searching!")
                            ? Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Welcome to Hobby-it!",
                                      style: TextStyle(
                                        fontSize: fontsize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.size.height * 0.05,
                                    ),
                                    RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      label: Text(
                                        "Start Searching!",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      icon: Icon(Icons.shuffle,
                                          color: Colors.white),
                                      onPressed: () {
                                        _fetchData();
                                        vibrate();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : TableData(
                                fontsize: fontsize,
                                value: receivedData,
                              ),
                      ),
                    ),
                    Container(
                      height: (mediaQuery.size.height * .30) / 60,
                      // decoration: boxDecoration,
                      child: _isLoading
                          ? LinearProgressIndicator(
                              minHeight: 3,
                            )
                          : Divider(
                              color: Theme.of(context).primaryColor,
                              thickness: 3,
                            ),
                    ),
                    Container(
                      width: mediaQuery.size.width,
                      // padding: EdgeInsets.all(0),
                      // decoration: boxDecoration,
                      height: (mediaQuery.size.height * .30) / 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // decoration: boxDecoration,
                            width: mediaQuery.size.width * 0.22,
                            child: FlatButton.icon(
                              hoverColor: Theme.of(context).primaryColorLight,
                              onPressed: null,
                              icon: Icon(
                                Icons.people,
                                color: firstTime
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                // 'hello',
                                firstTime
                                    ? " "
                                    : receivedData.participants.toString(),
                                // : '',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  // fontSize: fontsize - 4,
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   decoration: boxDecoration,
                          // width: mediaQuery.size.width * 0.2,
                          // child: FlatButton(
                          // FlatButton(
                          //   child: Icon(
                          //     Icons.attach_money,
                          //     color: Theme.of(context).primaryColor,
                          //   ),
                          //   onPressed: null,
                          // ),
                          // ),

                          Container(
                            // decoration: boxDecoration,
                            width: mediaQuery.size.width * 0.2,
                            child: FlatButton(
                              child: Platform.isIOS
                                  ? Icon(
                                      const IconData(
                                        // 62666, //share ICON
                                        61984,
                                        fontFamily: CupertinoIcons.iconFont,
                                        fontPackage:
                                            CupertinoIcons.iconFontPackage,
                                      ),
                                      color: firstTime
                                          ? Theme.of(context).disabledColor
                                          : Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.share,
                                      color: firstTime
                                          ? Theme.of(context).disabledColor
                                          : Theme.of(context).primaryColor,
                                    ),
                              onPressed: firstTime
                                  ? null
                                  : () {
                                      vibrate();
                                      Share.share(receivedData.activity);
                                    },
                            ),
                          ),
                          Container(
                            // decoration: boxDecoration,
                            width: mediaQuery.size.width * 0.2,
                            child: FlatButton(
                              onPressed: firstTime
                                  ? null
                                  : () async {
                                      // columnIdcreated;
                                      vibrate();
                                      if (!receivedData.isFavourite) {
                                        setState(() {
                                          receivedData.isFavourite = true;
                                          _isStar = !_isStar;
                                          receivedData.savedTime =
                                              DateTime.now();
                                        });
                                        columnIdcreated =
                                            await savedActivityList
                                                .addItem(receivedData);
                                        print(columnIdcreated);
                                      } else {
                                        setState(() {
                                          receivedData.isFavourite = false;
                                          _isStar = !_isStar;
                                        });
                                        // int index = savedActivityList.savedItems.elementAt(index)
                                        savedActivityList
                                            .removeItem(columnIdcreated);
                                      }
                                      // savedActivityLis
                                    },
                              child: Icon(
                                _isStar
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                // Icons.bookmark_border,
                                color: firstTime
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          // RaisedButton(
                          //   child: Text("sexy"),
                          //   onPressed: () async {
                          //     List<Map<String, dynamic>> rowow =
                          //         await DatabaseHelper.instance.queryALl();
                          //     print(rowow);
                          //     // int rowsAffected =
                          //     //     await DatabaseHelper.instance.delete(1);
                          //     // print(rowsAffected);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                // decoration: boxDecoration,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Theme.of(context).primaryColorDark,
                  elevation: 20,
                  child: GridViewButtons(
                      // fontsize: fontsize,
                      ),
                ),
              ),
            ),
            Container(
              // width: mediaQuery.size.width * 0.6,
              width: double.infinity,
              height: 42,

              // decoration: boxDecoration,
              child: RaisedButton.icon(
                // shadowColor: Theme.of(context).primaryColorDark,
                // elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
                icon: Icon(
                  Icons.shuffle,
                  color: Colors.white,
                ),
                label: Text(
                  "Find Something",
                  style: TextStyle(
                    fontSize: fontsize,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print(callKey);
                  print(globals.callKey);

                  print(globals.callKey);
                  _fetchData();
                  vibrate();
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
    // body: CircleShape(),
  }
}
