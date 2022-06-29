import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors{
  Color yellow=const Color(0xffFED000);
  Color bLue1=const Color(0xff1C8692);
  var bLue2=const Color(0xff10596D);
  var bLue3=const Color(0xff145E77);
  var darkColor=const Color(0xff363636);
  List<Color>myGradient(BuildContext context){
    return Theme.of(context).brightness
        == Brightness.dark?[Colors.black,Colors.black]:
     [
      const Color(0xFFE0E0E0), Colors.white
    ];
  }
}