

import 'package:flutter/material.dart';
import 'package:flutter_test_one/controllers/services/app_share_preference_service.dart';
import 'package:flutter_test_one/views/utlis/appThemes/app_day_theme.dart';
import 'package:flutter_test_one/views/utlis/appThemes/app_night_theme.dart';
import 'package:flutter_test_one/views/utlis/constants/app_constants.dart';

class AppThemeHandler{
  var dayTheme = AppDayTheme().dayTheme();
  var nightTheme = AppNighTheme().nightTheme();
  var pref = AppSharePreferenceService();


}