import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/variables.dart' as globals;

class GridViewButtons extends StatefulWidget {
  const GridViewButtons({
    Key key,
    @required this.fontsize,
  }) : super(key: key);

  final double fontsize;

  @override
  _GridViewButtonsState createState() => _GridViewButtonsState();
}

class _GridViewButtonsState extends State<GridViewButtons> {
  /////
  // ListView Variables
  bool isActivity = false;
  bool isParticipants = true;
  bool isPrice = false;
  bool isAccessibility = false;

  var value = 1.0;
  var accessValue = 0.0;
  var priceValue = 0.0;

  //////

  bool isAll = true;
  bool isEducation = false;
  bool isRecreational = false;
  bool isSocial = false;
  bool isDIY = false;
  bool isCharity = false;
  bool isCooking = false;
  bool isRelaxtion = false;
  bool isMusic = false;
  bool isBusywork = false;

  Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.selectionClick',
    );
  }

  void setColorKey(String key) {
    setState(() {
      globals.colorKey = 'isGrid';
      vibrate();
      if (key == 'isAll') {
        isAll = true;
        isEducation = isRecreational = isSocial = isDIY =
            isCharity = isCooking = isRelaxtion = isMusic = isBusywork = false;
        globals.isAll = true;
      } else if (key == 'isEducation') {
        isEducation = true;
        isAll = isRecreational = isSocial = isDIY =
            isCharity = isCooking = isRelaxtion = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'education';
      } else if (key == 'isRecreational') {
        isRecreational = true;
        isEducation = isRelaxtion = isSocial = isDIY =
            isCharity = isCooking = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'recreational';
      } else if (key == 'isSocial') {
        isSocial = true;
        isEducation = isRecreational = isRelaxtion = isDIY =
            isCharity = isCooking = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'social';
      } else if (key == 'isDIY') {
        isDIY = true;
        isEducation = isRecreational = isSocial = isRelaxtion =
            isCharity = isCooking = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'diy';
      } else if (key == 'isCharity') {
        isCharity = true;
        isEducation = isRecreational = isSocial = isDIY =
            isRelaxtion = isCooking = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'charity';
      } else if (key == 'isCooking') {
        isCooking = true;
        isEducation = isRecreational = isSocial = isDIY =
            isCharity = isRelaxtion = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'cooking';
      } else if (key == 'isRelaxation') {
        isRelaxtion = true;
        isEducation = isRecreational = isSocial = isDIY =
            isCharity = isCooking = isAll = isMusic = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'relaxation';
      } else if (key == 'isMusic') {
        isMusic = true;
        isEducation = isRecreational = isSocial = isDIY =
            isCharity = isCooking = isAll = isRelaxtion = isBusywork = false;
        globals.isAll = false;
        globals.isActivityType = 'music';
      } else if (key == 'isBusywork') {
        isBusywork = true;
        isEducation = isRecreational = isSocial = isDIY =
            isCharity = isCooking = isAll = isMusic = isRelaxtion = false;
        globals.isAll = false;
        globals.isActivityType = 'busywork';
      }
      globals.callKey = 'isActivity';
    });
  }

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

  @override
  Widget build(BuildContext context) {
    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
          style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20),
    );

    // var mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        Expanded(
          child: GridView.count(
            childAspectRatio: 5,
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 23,
                    color: isAll ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isAll');
                },
                color: isAll ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
                // autofocus: false,
              ),
              RaisedButton(
                child: Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 23,
                    color: isEducation ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isEducation');
                },
                color:
                    isEducation ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Recreational',
                  style: TextStyle(
                    fontSize: 23,
                    color: isRecreational ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isRecreational');
                },
                color: isRecreational
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Social',
                  style: TextStyle(
                    fontSize: 23,
                    color: isSocial ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isSocial');
                },
                color: isSocial ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'DIY',
                  style: TextStyle(
                    fontSize: 23,
                    color: isDIY ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isDIY');
                },
                color: isDIY ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Charity',
                  style: TextStyle(
                    fontSize: 23,
                    color: isCharity ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isCharity');
                },
                color:
                    isCharity ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Cooking',
                  style: TextStyle(
                    fontSize: 23,
                    color: isCooking ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isCooking');
                },
                color:
                    isCooking ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Relaxation',
                  style: TextStyle(
                    fontSize: 23,
                    color: isRelaxtion ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isRelaxation');
                },
                color:
                    isRelaxtion ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Music',
                  style: TextStyle(
                    fontSize: 23,
                    color: isMusic ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isMusic');
                },
                color: isMusic ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
              RaisedButton(
                child: Text(
                  'Busywork',
                  style: TextStyle(
                    fontSize: 23,
                    color: isBusywork ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setColorKey('isBusywork');
                },
                color:
                    isBusywork ? Theme.of(context).primaryColor : Colors.white,
                shape: roundedRectangleBorder,
              ),
            ],
          ),
        ),
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
