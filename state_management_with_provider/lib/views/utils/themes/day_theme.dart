
import 'package:flutter/material.dart';
import 'package:state_management_with_provider/views/utils/colors/colors.dart';

class AppDayTheme{

 ThemeData appDayTheme(){
    return ThemeData(
      scaffoldBackgroundColor: dayScaffoldBackgroundColor,
      appBarTheme: dayAppBarTheme(),
      floatingActionButtonTheme: dayFloatingActionButtonTheme()
    );
  }

AppBarTheme  dayAppBarTheme() {
   return AppBarTheme(
     backgroundColor:dayAppBarBackgroundColor,

   );
  }

 FloatingActionButtonThemeData dayFloatingActionButtonTheme() {
   return FloatingActionButtonThemeData(
     backgroundColor: dayFabBackgroundColor,
   );
  }

}