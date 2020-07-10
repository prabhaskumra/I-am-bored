import 'package:flutter/material.dart';

import '../widgets/gridview_buttons.dart';

// enum SelectedButton {
//   Activity,
//   Paricipants,
//   Price,
//   Accessibility,
// }

class ListViewButtons extends StatefulWidget {
  const ListViewButtons({
    Key key,
    @required this.fontsize,
  }) : super(key: key);

  final double fontsize;

  @override
  _ListViewButtonsState createState() => _ListViewButtonsState();
}

class _ListViewButtonsState extends State<ListViewButtons> {
  bool isActivity = true;
  bool isParticipants = false;
  bool isPrice = false;
  bool isAccessibility = false;

  var value = 1.0;

  @override
  Widget build(BuildContext context) {
    // var selectedKey = SelectedButton.Activity;

    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10),
    );

    void setKey(String key) {
      setState(() {
        if (key == 'isActivity') {
          isActivity = true;
          isParticipants = isAccessibility = isPrice = false;
        } else if (key == 'isParticipants') {
          isParticipants = true;
          isPrice = isAccessibility = isActivity = false;
        } else if (key == 'isPrice') {
          isPrice = true;
          isParticipants = isAccessibility = isActivity = false;
        } else if (key == 'isAccessibility') {
          isAccessibility = true;
          isParticipants = isActivity = isPrice = false;
        }
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.ac_unit,
                    color: isActivity ? Colors.white : Colors.black,
                  ),
                  shape: roundedRectangleBorder,
                  onPressed: () {
                    setKey('isActivity');
                  },
                  label: Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: widget.fontsize,
                      color: isActivity ? Colors.white : Colors.black,
                    ),
                  ),
                  color: isActivity
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
              ),
              // Divider(),
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
                    print(isParticipants);
                    print(isActivity);
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
                    Icons.ac_unit,
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
        isActivity
            ? Expanded(
                child: GridViewButtons(),
              )
            : Row(
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
                            : (isParticipants
                                ? "1"
                                : (isPrice ? 'Low' : 'Least')),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                      divisions: null,
                      max: 5,
                      min: 1,
                      label: "112121",
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
                            : (isParticipants
                                ? "5"
                                : (isPrice ? 'High' : 'Most')),
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
