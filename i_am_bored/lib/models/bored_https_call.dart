import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bored_data.dart';

class BoredHttpsCall {
  Future hasInitilized;

  List<BoredData> _items = [];

  Future<void> callByActivity() async {
    const url = 'https://www.boredapi.com/api/activity/';
    try {
      final response = await http.get(url);
      final extranctedData = json.decode(response.body) as Map<String, dynamic>;

      // final List<BoredData> loadedProducts = [];
      print(extranctedData);

      print("readching here");
    } catch (error) {
      throw (error);
    }
  }

  Future<void> callByParticipants(int quantity) {
    String url = 'https://www.boredapi.com/api/activity?participants=$quantity';
  }
}
