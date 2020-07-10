import 'package:flutter/material.dart';

class GridViewButtons extends StatefulWidget {
  const GridViewButtons({
    Key key,
  }) : super(key: key);

  @override
  _GridViewButtonsState createState() => _GridViewButtonsState();
}

class _GridViewButtonsState extends State<GridViewButtons> {
  @override
  Widget build(BuildContext context) {
    var roundedRectangleBorder = RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10),
    );
    return GridView.count(
      childAspectRatio: 4,
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
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Education',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Recreational',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Social',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'DIY',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Charity',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Cooking',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Relaxation',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Music',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
        RaisedButton(
          child: Text(
            'Busywork',
            style: TextStyle(fontSize: 23),
          ),
          onPressed: () {},
          color: Theme.of(context).bottomAppBarColor,
          shape: roundedRectangleBorder,
        ),
      ],
    );
  }
}
