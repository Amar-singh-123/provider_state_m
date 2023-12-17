
import 'package:flutter/material.dart';
import 'package:flutter_test_one/views/utlis/colors/app_colors.dart';

class AppDayTheme{

  ThemeData dayTheme(){
    return ThemeData(
      appBarTheme: _appBarTheme(),
      scaffoldBackgroundColor: dayScaffoldBackgroundColor,
    );
  }

AppBarTheme  _appBarTheme(){
    return AppBarTheme(
      backgroundColor: dayAppBarBackgroundColor,
    );
  }

}