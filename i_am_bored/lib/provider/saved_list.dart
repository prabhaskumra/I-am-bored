import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../models/bored_data.dart';

class SavedList with ChangeNotifier {
  // final BoredData boredItem;

  List<BoredData> _savedItems = [];

  // SavedList(this.boredItem);

  void addItem(BoredData item) {
    _savedItems.add(item);
    notifyListeners();
  }

  void removeItem(int key) {
    notifyListeners();
  }
}
