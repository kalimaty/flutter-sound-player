import 'package:flutter/material.dart';
import 'package:sound_player/themes/dark_mode.dart';
import 'package:sound_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initialy lightMode
  ThemeData _themeData = lightMode;
  //get Theme
  ThemeData get themeData => _themeData;
  //isDarkMode
  bool get isDarkMode => _themeData == darkMode;
  //set Theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    //update ui
    notifyListeners();
  }

  //toggleTheme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
