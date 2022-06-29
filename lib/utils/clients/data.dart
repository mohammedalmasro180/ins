import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/theme.dart';



late SharedPreferences appData;
//late SharedPreferences userData;

const tokenKey='token';

Future<void> initAppData() async {
  appData = await SharedPreferences.getInstance();
 // userData= await SharedPreferences.getInstance();
}

set themeMode(ThemeData mode) {
  appData.setBool(
      'isDark', mode.brightness == Brightness.dark);
}


ThemeData get themeMode => appData.getBool('isDark') == null
    ? MyThemes.lightTheme
    : appData.getBool('isDark')??false
        ? MyThemes.darkTheme : MyThemes.lightTheme;

bool checkToken()  {
    return appData.containsKey(tokenKey);
}

bool isDarkMode(BuildContext context){
  return Theme.of(context).brightness
      == Brightness.dark;
}
void deleteToken(){
  appData.remove(tokenKey);
}
setToken(String token){
  appData.setString(tokenKey, token);
}
getToken(){
  return appData.containsKey(tokenKey)?appData.getString(tokenKey):"";
}

Future<bool> internetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}