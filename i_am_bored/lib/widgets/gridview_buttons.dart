import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/variables.dart' as globals;

class GridViewButtons extends StatefulWidget {
  const GridViewButtons({
    Key key,
  }) : super(key: key);

  @override
  _GridViewButtonsState createState() => _GridViewButtonsState();
}

class _GridViewButtonsState extends State<GridViewButtons> {
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

  @override
  Widget build(BuildContext context) {
    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(20),
    );

    // var mediaQuery = MediaQuery.of(context);

    return GridView.count(
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
          color: isEducation ? Theme.of(context).primaryColor : Colors.white,
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
          color: isRecreational ? Theme.of(context).primaryColor : Colors.white,
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
          color: isCharity ? Theme.of(context).primaryColor : Colors.white,
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
          color: isCooking ? Theme.of(context).primaryColor : Colors.white,
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
          color: isRelaxtion ? Theme.of(context).primaryColor : Colors.white,
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
          color: isBusywork ? Theme.of(context).primaryColor : Colors.white,
          shape: roundedRectangleBorder,
        ),
      ],
    );
  }
}
