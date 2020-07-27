import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

import '../widgets/circle_shape.dart';
import '../widgets/app_drawer.dart';
import '../models/bored_https_call.dart';
import '../widgets/table_data.dart';
import '../models/bored_data.dart';
import '../widgets/list_view_buttons.dart';
import '../widgets/gridview_buttons.dart';
import '../models/variables.dart' as globals;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fontsize = 22.0;

  BoredHttpsCall callClass;
  BoredData receivedData;
  bool firstTime = true;
  String dropDown = 'Activity';
  // var _isInit = true;
  var _isLoading = false;
  String callKey = 'byActivity';
  double callValue;
  var _isStar = false;

  // ListViewButtons(fontsize: fontsize) listButtons;
  // ListViewButtons listButtons = ListViewButtons(fontsize: fontsize);

  @override
  void initState() {
    super.initState();
  }

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
    setState(() {
      firstTime = false;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight / 1.2,
        // toolbarHeight: kToolbarHeight * 5,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(30, 30),
            // bottom: Radius.circular(50),
          ),
        ),
        title: Text(
          'The Bored App',
          style: TextStyle(
            fontSize: fontsize,
          ),
        ),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.blue[50],
          // color: Colors.blue,
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
                            ? Text("Start Searching!")
                            : TableData(
                                fontsize: fontsize,
                                value: receivedData,
                              ),
                        // child: firstTime ? Text('Hello') : Text("NONON"),
                      ),
                    ),
                    Container(
                      height: (mediaQuery.size.height * .30) / 60,
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: Theme.of(context).primaryColor,
                      //     width: 1,
                      //   ),
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
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
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                // 'hello',
                                firstTime
                                    ? " "
                                    : receivedData.participants.toString(),
                                // : '',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: fontsize - 4,
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   decoration: boxDecoration,
                          // width: mediaQuery.size.width * 0.2,
                          // child: FlatButton(
                          FlatButton(
                            child: Icon(
                              Icons.attach_money,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: null,
                          ),
                          // ),
                          Container(
                            // decoration: boxDecoration,
                            width: mediaQuery.size.width * 0.2,
                            child: FlatButton(
                              onPressed: firstTime
                                  ? null
                                  : () {
                                      vibrate();
                                      setState(() {
                                        _isStar = !_isStar;
                                      });
                                    },
                              child: Icon(
                                _isStar ? Icons.star : Icons.star_border,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Container(
                            // decoration: boxDecoration,
                            width: mediaQuery.size.width * 0.2,
                            child: FlatButton(
                              child: Platform.isIOS
                                  ? Icon(
                                      IconData(
                                        62666, //share ICON
                                        fontFamily: CupertinoIcons.iconFont,
                                        fontPackage:
                                            CupertinoIcons.iconFontPackage,
                                      ),
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.share,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              onPressed: firstTime
                                  ? null
                                  : () {
                                      vibrate();
                                      Share.share(receivedData.activity);
                                    },
                            ),
                          ),
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
                child: GridViewButtons(
                  fontsize: fontsize,
                ),
              ),
            ),
            //////
            ///
            ///
            ///
            ///
            // Container(
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.symmetric(vertical: 20.0),
            //   // width: 200,

            //   height: 100,
            //   // height: mediaQuery.size.height * .16,

            //   // decoration: boxDecoration,
            //   child: listButtons,
            // ),

            //////////
            ///
            ///
            // Expanded(
            //   child: GridViewButtons(),
            // ),
            Container(
              width: mediaQuery.size.width * 0.6,
              height: 42,
              // decoration: boxDecoration,
              child: RaisedButton.icon(
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
                  // callKey = ListViewButtons(
                  //   fontsize: fontsize,
                  // ).getCallKeyValue();
                  // callKey = ListViewButtons
                  print(callKey);
                  print(globals.callKey);
                  // globals.callKey = 'hhdfahsdhfad';
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
      // body: CircleShape(),
    );
  }
}
