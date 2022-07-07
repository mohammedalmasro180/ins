import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool get themeDefaultIsDark =>
    SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

const LinearGradient defaultGradint = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accent,
      accent,
    ]);

BoxShadow cardShadow({Offset? offset, Color? color, double? blurRadius}) {
  return BoxShadow(
    blurRadius: blurRadius ?? 11,
    offset: offset ?? const Offset(0, 8),
    color: color ??
        scaffoldBackground(true).withOpacity(0.1),
  );
}









//mhd color
const bluLayerzero=Color(0xffd6e7f1);
const bluLayerone=Color(0xff98c8dc);
const bluLayerthere=Color(0xff0d89bf);
const bluLayerfore=Color(0xff04457b);
const bluLayerfive=Color(0xff011c4b);
const mybkg=Color(0xfffafafa);
const myred=Color(0xffdf2f2f);
const mygreen=Color(0xff5dc359);
const myyallow=Color(0xfffdcf00);
const mygray=Color(0xffeeeeee);


const appbar=Color(0xff98c8dc);
const Containercolor=Color(0xff98c8dc);

// ignore: prefer_typing_uninitialized_variables





Color scaffoldBackground(isDark) =>
    isDark??true ? const Color(0xff121212) : const Color(0xffffffff);
const accent = Color(0xff00aff0);
const Map<String, Color> mainColors = {
  'blue': accent,
  'blue-green': accent,
  'green-blue': accent,
  'green': accent,
  'dark-green': accent,
  'light-green': Color(0xff8eddbd),
  'light-orange': Color(0xffff9501),
  'error': Color(0xfffc6500),
  'icon-button': Color(0xffFC6500),
  'field-fill': Color(0xff00aff0),
};

/*
const Map<String, Color> mainColors = {
  'dark-blue': Color(0xff0068ab),
  'blue': Color(0xff0b86f9),
  'blue-green': Color(0xff19b5d8),
  'green-blue': Color(0xff19d8b2),
  'green': Color(0xff0bf982),
  'dark-green': Color(0xff61f9ad),
  'light-green': Color(0xff8eddbd),
  'light-orange': Color(0xffff9501),
  'dark-orange': Color(0xfffc6500),
};
*/

InputDecoration textFieldDecoration(BuildContext context) {
  return InputDecoration(
    focusColor: mainColors['blue-green'],
    fillColor: mainColors['field-fill']!.withOpacity(0.05),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(23),
        borderSide: BorderSide(
            color: Theme.of(context).brightness==Brightness.dark
                ? mainColors['dark-green']!
                : mainColors['green']!)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(23),
        borderSide: BorderSide(
            color: Theme.of(context).brightness==Brightness.dark
                ? mainColors['dark-green']!.withOpacity(0.2)
                : mainColors['green']!.withOpacity(0.2))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: mainColors['blue-green']!)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
            color: Theme.of(context).brightness==Brightness.dark
                ? mainColors['dark-green']!
                : mainColors['green']!)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: mainColors['light-orange']!)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 28),
    labelStyle: TextStyle(color: mainColors['green-blue']),
    errorStyle: TextStyle(color: mainColors['error']),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: mainColors['error']!)),
  );
}

Map<String, String> mapStyles = {
  'default': "auto",
  'normal': """[
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]""",
  'satellite': 'satellite'
};
