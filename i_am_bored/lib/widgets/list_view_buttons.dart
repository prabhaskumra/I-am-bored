import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:math';

import '../models/variables.dart' as globals;

class ListViewButtons extends StatefulWidget {
  const ListViewButtons({
    Key key,
    @required this.fontsize,
    // @required this.
  }) : super(key: key);

  final double fontsize;

  @override
  _ListViewButtonsState createState() => _ListViewButtonsState();
}

class _ListViewButtonsState extends State<ListViewButtons> {
  bool isActivity = false;
  bool isParticipants = true;
  bool isPrice = false;
  bool isAccessibility = false;

  var value = 1.0;
  var accessValue = 0.0;
  var priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    Future<void> vibrate() async {
      await SystemChannels.platform.invokeMethod<void>(
        'HapticFeedback.vibrate',
        'HapticFeedbackType.selectionClick',
      );
      // SystemChannels
    }

    // if (globals.colorKey == 'isGrid') {
    //   isParticipants = isAccessibility = isPrice;
    // }

    void setKey(String key) {
      vibrate();
      setState(() {
        globals.colorKey = 'isList';
        if (key == 'isParticipants') {
          isParticipants = true;
          isPrice = isAccessibility = isActivity = false;
          globals.callKey = 'isParticipants';
        } else if (key == 'isPrice') {
          isPrice = true;
          isParticipants = isAccessibility = isActivity = false;
          globals.callKey = 'isPrice';
        } else if (key == 'isAccessibility') {
          isAccessibility = true;
          isParticipants = isActivity = isPrice = false;
          globals.callKey = 'isAccessibility';
        }
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton.icon(
                  color: isParticipants
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: roundedRectangleBorder,
                  icon: Icon(
                    Icons.people,
                    color: isParticipants ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    isParticipants = true;
                    setKey('isParticipants');
                  },
                  label: Text(
                    "Pariticipants",
                    style: TextStyle(
                      fontSize: widget.fontsize,
                      color: isParticipants ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.attach_money,
                    color: isPrice ? Colors.white : Colors.black,
                  ),
                  shape: roundedRectangleBorder,
                  onPressed: () {
                    setKey('isPrice');
                  },
                  label: Text(
                    "Price",
                    style: TextStyle(
                      fontSize: widget.fontsize,
                      color: isPrice ? Colors.white : Colors.black,
                    ),
                  ),
                  color:
                      isPrice ? Theme.of(context).primaryColor : Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.accessibility_new,
                    color: isAccessibility ? Colors.white : Colors.black,
                  ),
                  shape: roundedRectangleBorder,
                  color: isAccessibility
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  onPressed: () {
                    setKey('isAccessibility');
                  },
                  label: Text(
                    "Accessibility",
                    style: TextStyle(
                      fontSize: widget.fontsize,
                      color: isAccessibility ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // border: Border.all(
                //   color: Theme.of(context).primaryColor,
                //   width: 1,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  isActivity
                      ? "Act"
                      : (isParticipants ? "1" : (isPrice ? 'Low' : 'Most')),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Slider.adaptive(
                inactiveColor: Theme.of(context).primaryColor,
                // activeColor: Color,
                activeColor: Theme.of(context).primaryColor,
                value: isPrice
                    ? priceValue
                    : (isAccessibility ? accessValue : value),
                autofocus: true,
                onChanged: (newValue) {
                  setState(() {
                    if (isAccessibility)
                      accessValue = double.parse((newValue).toStringAsFixed(2));
                    else if (isParticipants)
                      value = newValue;
                    else if (isPrice)
                      priceValue = double.parse((newValue).toStringAsFixed(2));

                    if (isAccessibility) {
                      globals.accessibliltyKey =
                          double.parse((newValue).toStringAsFixed(1));
                      print(globals.accessibliltyKey);
                    } else if (isPrice) {
                      globals.priceKey =
                          double.parse((newValue).toStringAsFixed(1));
                      print(globals.priceKey);
                    } else if (isParticipants) {
                      globals.participantsKey = newValue.toInt();
                      print(globals.participantsKey);
                    }
                  });
                  // vibrate();
                },
                divisions: isParticipants ? 4 : (isPrice ? 8 : 10),

                max: isParticipants ? 5 : (isAccessibility ? 1 : 0.8),
                min: (isPrice || isAccessibility) ? 0 : 1,
                label: isPrice
                    ? '$priceValue'
                    : (isAccessibility ? '$accessValue' : '$value'),
              ),
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // border: Border.all(
                //   color: Theme.of(context).primaryColor,
                //   width: 1,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  isActivity
                      ? "Act"
                      : (isParticipants ? "5" : (isPrice ? 'High' : 'Least')),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
