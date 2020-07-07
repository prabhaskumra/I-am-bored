import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bored_data.dart';

class BoredHttpsCall {
  Future hasInitilized;

  List<BoredData> items = [];

  Future<BoredData> callByActivity(BoredData value) async {
    const url = 'https://www.boredapi.com/api/activity/';
    try {
      final response = await http.get(url);
      final extranctedData = json.decode(response.body) as Map<String, dynamic>;

      // final List<BoredData> loadedProducts = [];
      print(extranctedData);
      var value = BoredData(
        activity: extranctedData['activity'],
        type: extranctedData['type'],
        participants: extranctedData['participants'],
        price: extranctedData['price'] + 0.0,
        link: extranctedData['link'],
        key: extranctedData['key'],
        accessibility: extranctedData['accessibility'] + 0.0,
      );

      return value;

      print(value.key);

      print("readching here");
    } catch (error) {
      throw (error);
    }
  }

  Future<void> callByParticipants(int quantity) {
    String url = 'https://www.boredapi.com/api/activity?participants=$quantity';
  }
}
