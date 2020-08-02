import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../models/bored_data.dart';

class SavedList with ChangeNotifier {
  // final BoredData boredItem;

  List<BoredData> savedItems = [];

  // SavedList(this.boredItem);

  void addItem(BoredData item) {
    savedItems.add(item);
    // print(_savedItems[0].activity);
    print(savedItems.length);
    notifyListeners();
  }

  void removeItem(int key) {
    notifyListeners();
  }
}
