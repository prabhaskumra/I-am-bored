import 'package:flutter/foundation.dart';

class BoredData {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;
  bool isFavourite;

  BoredData({
    @required this.activity,
    @required this.type,
    @required this.participants,
    @required this.price,
    @required this.link,
    @required this.key,
    @required this.accessibility,
    this.isFavourite = false,
  });
}
