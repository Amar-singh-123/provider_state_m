import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_with_provider/views/utils/themes/day_theme.dart';
import 'package:state_management_with_provider/views/utils/themes/night_theme.dart';

class ThemeHandlerProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppDayTheme().appDayTheme();
  bool _isDarkModeEnabled = false;

  get isDarkModeEnabled => _isDarkModeEnabled;
  set setDarkMode(bool val) {
    _isDarkModeEnabled = val;
    if(_isDarkModeEnabled == true){
      _currentTheme = AppNightTheme().appNightTheme();
    }
    else{
     _currentTheme = AppDayTheme().appDayTheme();
    }
    notifyListeners();
  }

  get currentTheme => _currentTheme;
  set setCurrentTheme(ThemeData value) {
    _currentTheme = value;
    notifyListeners();
  }
}
