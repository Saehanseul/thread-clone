import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeConfig extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

final darkModeProvider = ChangeNotifierProvider<DarkModeConfig>(
  (ref) {
    return DarkModeConfig();
  },
);
