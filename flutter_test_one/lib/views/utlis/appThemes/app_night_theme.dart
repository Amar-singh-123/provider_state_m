

import 'package:flutter/material.dart';
import 'package:flutter_test_one/views/utlis/colors/app_colors.dart';

class AppNighTheme{

  ThemeData nightTheme(){
    return ThemeData(
      appBarTheme: _appBarTheme(),
      scaffoldBackgroundColor: nightScaffoldBackgroundColor,
    );
  }
  AppBarTheme  _appBarTheme(){
    return const AppBarTheme(
      backgroundColor: nightAppBarBackgroundColor,

    );
  }

}