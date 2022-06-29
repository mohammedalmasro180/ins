import 'package:flutter/material.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
// ignore: camel_case_types
class mycolor extends StatefulWidget {
  const mycolor({Key? key}) : super(key: key);

  @override
  _mycolorState createState() => _mycolorState();
}

class _mycolorState extends State<mycolor> {

  @override
  Widget build(BuildContext context) {
    Color appbar;
    Color continer;
    Color txt;
    Color bk;
    Color mywhite;
    if(mode)
    {
      appbar=bluLayerone;
      continer=bluLayerfive;
      txt=bluLayerfive;
      mywhite=Colors.white;

      bk=Colors.white;

    }
    else
    {
      appbar=Colors.black;
      continer=Colors.white;
      txt=Colors.white;
      bk=Colors.black;
      mywhite=Colors.black;

    }


    return Container();
  }

  Future<String> getmode(){

  }
}