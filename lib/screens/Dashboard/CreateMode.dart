import 'package:flutter/material.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CreateMode{
  static createmode (
  Color appbar,
  Color continer,
  Color txt,
Color bk,
Color mywhite,) async {

//done_number

      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
      String shared=sharedPreferences.get("mode").toString();
      if(shared==null)
{
  appbar=bluLayerone;
  continer=bluLayerfive;
  txt=bluLayerfive;
  mywhite=Colors.white;

  bk=bluLayerfive;




}
      else
{
  appbar=Colors.black;
  continer=Colors.white;
  txt=Colors.white;
  bk=Colors.black;
  mywhite=Colors.black;
}

    }

}