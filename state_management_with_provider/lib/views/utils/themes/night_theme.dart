import 'package:flutter/material.dart';
import 'package:state_management_with_provider/views/utils/colors/colors.dart';

class AppNightTheme{

  ThemeData appNightTheme(){
    return ThemeData(
        scaffoldBackgroundColor: nightScaffoldBackgroundColor,
        appBarTheme: nightAppBarTheme(),
        floatingActionButtonTheme: nightFloatingActionButtonTheme(),
      textTheme: appNightTextTheme(),
    );
  }

  AppBarTheme  nightAppBarTheme() {
    return AppBarTheme(
      backgroundColor:dayAppBarBackgroundColor,

    );
  }

  FloatingActionButtonThemeData nightFloatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: dayFabBackgroundColor,
    );
  }




TextTheme  appNightTextTheme() {
    return TextTheme(
 bodyText1: TextStyle(color: Colors.white),
 bodyText2: TextStyle(color: Colors.white),
    );
}

}