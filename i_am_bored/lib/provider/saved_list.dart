import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../models/bored_data.dart';
import '../helpers/database_helper.dart';
import 'package:intl/intl.dart';

class SavedList with ChangeNotifier {
  // final BoredData boredItem;

  List<BoredData> savedItems = [];
  List<Map<String, dynamic>> databaseList = [];

  Future<int> addItem(BoredData item) async {
    savedItems.add(item);

    var isFavourite = 0;

    if (item.isFavourite) isFavourite = 1;

    item.columnId = await DatabaseHelper.instance.insert({
      DatabaseHelper.activity: item.activity,
      DatabaseHelper.type: item.type,
      DatabaseHelper.participants: item.participants,
      DatabaseHelper.price: item.price,
      DatabaseHelper.link: item.link,
      DatabaseHelper.key: item.key,
      DatabaseHelper.accessibility: item.accessibility,
      DatabaseHelper.isFavourite: isFavourite,
      DatabaseHelper.savedTime:
          DateFormat.yMd().add_jm().format(item.savedTime),
    });
    getDatabaseList();
    print('the inserted id is ${item.columnId}');

    notifyListeners();
    return item.columnId;
  }

  void removeItem(int key) async {
    int i = await DatabaseHelper.instance.delete(key);
    print('rows affected $i');
    getDatabaseList();
    // savedItems.removeAt(key);
    notifyListeners();
  }

  Future<void> getDatabaseList() async {
    databaseList = await DatabaseHelper.instance.queryALl();
    // databaseList.reversed.toList();
    notifyListeners();
  }
}
