import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import '../models/bored_data.dart';

class CustomThemeData with ChangeNotifier {
  var themeColor = Colors.teal;

  void changeColor(var selectedColor) {
    themeColor = selectedColor;
    notifyListeners();
  }
}
