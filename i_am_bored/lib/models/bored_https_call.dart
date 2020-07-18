import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bored_data.dart';
import '../models/variables.dart' as globals;

class BoredHttpsCall {
  Future hasInitilized;

  List<BoredData> items = [];

  Future<BoredData> callByActivity(
      BoredData value, String callKey, double callValue) async {
    String url;

    switch (globals.callKey) {
      case "isActivity":
        {
          if (globals.isAll) {
            url = 'https://www.boredapi.com/api/activity/';
          } else {
            url =
                'http://www.boredapi.com/api/activity?type=${globals.isActivityType}';
          }

          break;
        }

      case "isParticipants":
        {
          url =
              'http://www.boredapi.com/api/activity?participants=${globals.participantsKey}';
          break;
        }

      case "isPrice":
        {
          url =
              'http://www.boredapi.com/api/activity?price=${globals.priceKey}';
          break;
        }

      case "isAccessibility":
        {
          url =
              'http://www.boredapi.com/api/activity?accessibility=${globals.accessibliltyKey}';
          break;
        }
    }

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
    } catch (error) {
      throw (error);
    }
  }

  Future<void> callByParticipants(int quantity) {
    String url = 'https://www.boredapi.com/api/activity?participants=$quantity';
  }
}
