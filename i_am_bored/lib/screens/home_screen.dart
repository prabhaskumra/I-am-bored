import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/circle_shape.dart';
import '../widgets/app_drawer.dart';
import '../models/bored_https_call.dart';
import '../widgets/table_data.dart';
import '../models/bored_data.dart';
import '../widgets/list_view_buttons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fontsize = 22.0;

  BoredHttpsCall callClass;
  BoredData receivedData;
  bool firstTime = false;
  String dropDown = 'Activity';

  Future<void> _fetchData() async {
    BoredData value;
    receivedData = await BoredHttpsCall().callByActivity(value);
    // receivedData = value;

    setState(() {
      firstTime = true;
    });

    // print("RECEIED DATA");
    // print(receivedData.key);
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
            // bottom: Radius.circular(50),
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
              width: double.infinity,
              child: Card(
                child: Text(
                  'How are you feeling today?',
                  style: TextStyle(fontSize: fontsize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            firstTime
                ? Container(
                    // width: Platform.isMacOS
                    //     ? MediaQuery.of(context).size.width * .50
                    //     : double.infinity,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Theme.of(context).primaryColor,
                      //   width: 1,
                      // ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Card(
                      // borderOnForeground: mounted,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Theme.of(context).primaryColorDark,
                      elevation: 20,
                      child: Column(
                        children: [
                          TableData(
                            fontsize: fontsize,
                            value: receivedData,
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                            // endIndent: fontsize,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              FlatButton.icon(
                                hoverColor: Theme.of(context).primaryColorLight,
                                onPressed: null,
                                icon: Icon(
                                  Icons.people,
                                  color: Theme.of(context).primaryColor,
                                ),
                                label: Text(
                                  receivedData.participants.toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: fontsize - 4,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.attach_money,
                                color: Theme.of(context).primaryColor,
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.star_border,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Text('First Time'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              // width: 200,
              height: 100,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Theme.of(context).primaryColor,
                  //   width: 2,
                  // ),
                  // borderRadius: BorderRadius.all(radius),
                  ),
              child: ListViewButtons(fontsize: fontsize),
              // child: DropdownButton<String>(
              //   value: dropDown,
              //   icon: Icon(Icons.keyboard_arrow_down),
              //   iconSize: 24,
              //   elevation: 16,
              //   style: TextStyle(
              //     color: Theme.of(context).primaryColor,
              //   ),
              //   // underline: Container(
              //   //   height: 2,
              //   //   color: Theme.of(context).primaryColor,
              //   // ),
              //   items: <String>[
              //     'Activity',
              //     'Participants',
              //     'Price',
              //   ].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (String newValue) {
              //     setState(() {
              //       dropDown = newValue;
              //     });
              //   },
              // ),
            ),
            // Container(
            //   child: Slider.adaptive(value: 0, onChanged: null),
            // ),
            RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
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
              onPressed: _fetchData,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      // body: CircleShape(),
    );
  }
}
