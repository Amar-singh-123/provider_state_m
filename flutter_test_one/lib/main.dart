

import 'package:flutter/material.dart';
import 'package:flutter_test_one/views/screens/profile/profile_screen.dart';
import 'package:flutter_test_one/views/utlis/appThemes/app_day_theme.dart';
import 'package:flutter_test_one/views/utlis/appThemes/app_night_theme.dart';
import 'package:flutter_test_one/views/utlis/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a global key to access the state of the top-level widget
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test one',
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      theme: AppThemeHandler().currentTheme,
      navigatorKey: navigatorKey, // Assign the navigatorKey
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkEnabled = false;
  late AppSharePreferenceService pref;

  @override
  void initState() {
    super.initState();
    pref = AppSharePreferenceService();
    getCurrentTheme();
  }

  void getCurrentTheme() async {
    bool? isDayModeEnabled = await pref.getBoolean(key: dayThemeKey);
    setState(() {
      isDarkEnabled = isDayModeEnabled ?? false;
    });
  }

  void updateTheme(bool isDayModeEnabled) {
    setState(() {
      isDarkEnabled = isDayModeEnabled;
      pref.setBoolean(key: dayThemeKey, value: isDayModeEnabled);
      AppThemeHandler().updateTheme(isDayModeEnabled);

      // Notify MyApp widget to rebuild the entire app with the updated theme
      MyApp.navigatorKey.currentState?.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Themes"),
        actions: [
          themeHandleSwitch(),
        ],
      ),
      body: Center(
        child: Text(
          'Theme Example',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  Widget themeHandleSwitch() {
    return Switch(
      value: isDarkEnabled,
      onChanged: (value) {
        updateTheme(value);
      },
    );
  }
}

class AppSharePreferenceService {
  Future<SharedPreferences> getPref() async =>
      await SharedPreferences.getInstance();

  Future<void> setBoolean({required String key, required bool value}) async {
    SharedPreferences pref = await getPref();
    await pref.setBool(key, value);
  }

  Future<bool?> getBoolean({required String key}) async {
    SharedPreferences pref = await getPref();
    return pref.getBool(key);
  }
}

class AppThemeHandler {
  late ThemeData currentTheme;

  AppThemeHandler() {
    updateTheme(false); // Initialize the theme
  }

  void updateTheme(bool isDayModeEnabled) {
    if (isDayModeEnabled) {
      currentTheme = AppDayTheme().dayTheme();
    } else {
      currentTheme = AppNighTheme().nightTheme();
    }
  }
}






















// import 'dart:developer';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test_one/controllers/services/app_share_preference_service.dart';
// import 'package:flutter_test_one/views/screens/auth/email/sign_up_width_email_screen.dart';
// import 'package:flutter_test_one/views/screens/profile/profile_screen.dart';
// import 'package:flutter_test_one/views/screens/splash/splash_screen.dart';
// import 'package:flutter_test_one/views/utlis/appThemes/app_day_theme.dart';
// import 'package:flutter_test_one/views/utlis/appThemes/app_night_theme.dart';
// import 'package:flutter_test_one/views/utlis/appThemes/theme_handler.dart';
// import 'package:flutter_test_one/views/utlis/constants/app_constants.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// import 'firebase_options.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await GetStorage.init();
//   runApp( MyApp());
// }
//
// class MyApp extends StatefulWidget {
//    MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   AppThemeHandler appThemeHandler = AppThemeHandler();
//
//  var currentTheme = ThemeData();
// @override
//   void initState() {
//   getCurrentTheme();
//     super.initState();
//   }
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter test one',
//       debugShowCheckedModeBanner: false,
//       theme: currentTheme,
//       home: const ProfileScreen(),
//     );
//   }
//
//   void getCurrentTheme() async{
//   if(!mounted){
//     return;
//   }
//   var pref = AppSharePreferenceService();
//   var isDayModeEnabled = await pref.getBoolean(key: dayThemeKey);
//   // var isNightModeEnabled =  pref.getBoolean(key: nightThemeKey).asStream();
//
//   if(isDayModeEnabled == true){
//     currentTheme = AppThemeHandler().dayTheme;
//   }
//   else{
//     currentTheme = AppThemeHandler().nightTheme;
//   }
//
//   setState(() {
//
//   });
//   }
// }
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   bool isDarkEnabled = false;
//   var pref = AppSharePreferenceService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("themes"),
//         actions: [
//           themeHandleSwitch(),
//         ],
//       ),);
//   }
//
//   Widget themeHandleSwitch() {
//     return Switch(value: isDarkEnabled, onChanged: (value) {
//       setState(() {
//         isDarkEnabled = value;
//         pref.setBoolean(key: dayThemeKey, value: value);
//
//       });
//     });
//   }
// }
//
//
//
// class AppSharePreferenceService{
//
//   getPref()=> SharedPreferences.getInstance();
//
//   setBoolean({required String key,required bool value}) async{
//     SharedPreferences pref = await getPref();
//     pref.setBool(key, value);
//   }
//   Future<bool?> getBoolean({required String key}) async{
//     SharedPreferences pref = await getPref();
//     return  pref.getBool(key);
//   }
//
//
// }
//
//
// class AppThemeHandler{
//   var dayTheme = AppDayTheme().dayTheme();
//   var nightTheme = AppNighTheme().nightTheme();
//   var pref = AppSharePreferenceService();
//
//
// }