

import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreferenceService{

  getPref()=> SharedPreferences.getInstance();

  setBoolean({required String key,required bool value}) async{
    SharedPreferences pref = await getPref();
    pref.setBool(key, value);
  }
 Future<bool?> getBoolean({required String key}) async{
    SharedPreferences pref = await getPref();
   return  pref.getBool(key);
  }


}