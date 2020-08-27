import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class SubmissionsHttp {
  Future<void> submitActivity(SubmissionsData submissionsData) async {
    String url = 'https://hobby-it.firebaseio.com/activities-submissions.json?';

    final response = await http.post(url,
        body: json.encode({
          "activity": submissionsData.activity,
          "type": submissionsData.type,
          "participants": submissionsData.participants,
          "link": submissionsData.link,
          "name": submissionsData.name,
          "email": submissionsData.email,
        }));
  }
}

class SubmissionsData {
  int columnId;
  final String activity;
  final String type;
  final String participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;
  final String name;
  final String email;
  DateTime savedTime;
  String notes;

  SubmissionsData({
    this.columnId,
    @required this.activity,
    @required this.type,
    @required this.participants,
    this.name,
    this.email,
    this.price,
    this.link,
    this.key,
    this.accessibility,
    this.savedTime,
    this.notes,
  });
}
