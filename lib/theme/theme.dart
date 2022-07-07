import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MyThemes {
  static final primary = MyColors().bLue3;
  static final myBlue1= MyColors().bLue1;
  static final myBlue2= MyColors().bLue2;
  static const fontFamily="Cairo";
  static const CariofontFamily="Cairo";



  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: myBlue2,
        borderRadius: BorderRadius.circular(25),
      ),
      labelColor: Colors.white,
      labelStyle:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,fontFamily:fontFamily),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    cardColor: MyColors().darkColor,
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize:25,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      headline6: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      caption: TextStyle(fontSize:14, fontWeight: FontWeight.normal, color: MyColors().bLue2, fontFamily:fontFamily),
      subtitle1: TextStyle(fontSize:14, fontWeight: FontWeight.normal,color: MyColors().bLue2,fontFamily: 'Logistics'),
      button:  TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:12) ,
      bodyText1: TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:14) ,
      bodyText2: TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.normal,fontFamily:fontFamily,fontSize:14) ,
    ),
    primaryTextTheme: TextTheme(
      button: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:15),
      headline5: TextStyle(
          fontSize:25,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      headline6: const TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black,fontFamily:fontFamily),
      caption: const TextStyle(fontSize:14, fontWeight: FontWeight.normal, color: Colors.black, fontFamily:fontFamily),
      subtitle1: const TextStyle(fontSize:14, fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Logistics'),
      subtitle2: const TextStyle(fontSize:14, fontWeight: FontWeight.normal,color: Colors.black,fontFamily: 'Logistics'),
      bodyText1: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:14) ,
      bodyText2: const TextStyle(color:Colors.black,fontWeight: FontWeight.normal,fontFamily:fontFamily,fontSize:14) ,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.transparent,
          minimumSize: const Size(88, 36),
          textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:fontFamily,),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          shape:  RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color:  MyColors().yellow)
          ),
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color:   MyColors().yellow,
                  width: 2,
                );
              }
              return   BorderSide(
                color:   MyColors().yellow,
                width: 3,
              ); // Defer to the widget's default.
            },
          ),
        )),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle()
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      buttonColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
        overlayColor:  MaterialStateProperty.all<Color>(myBlue1),
        padding:  MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all<Color>(primary),
        textStyle:  MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white,)),
        shape:MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ))
    ),
    ),
    shadowColor:  myBlue1,
    primaryColor: primary,
    cardTheme: CardTheme(color: myBlue1,),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 1.0,
        backgroundColor: primary,
        foregroundColor: Colors.white.withOpacity(0.7)
    ),
    iconTheme: const IconThemeData(color: Colors.white,),
    colorScheme: ColorScheme.dark(
      primary: primary,
      background: myBlue2,
    ),
    scaffoldBackgroundColor: MyColors().darkColor,
    backgroundColor: MyColors().darkColor,
    primaryColorDark: MyColors().darkColor,
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: MyColors().yellow,
        borderRadius: BorderRadius.circular(25),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      labelStyle:const TextStyle(fontSize:14,fontWeight: FontWeight.bold,fontFamily:fontFamily),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    cardColor: Colors.white,
    textTheme: TextTheme(
      headline5: TextStyle(
          fontSize:25,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      headline6: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      caption: TextStyle(fontSize:14, fontWeight: FontWeight.normal, color: MyColors().bLue2, fontFamily:fontFamily),
      subtitle1: TextStyle(fontSize:14, fontWeight: FontWeight.normal,color: MyColors().bLue2,fontFamily: 'Logistics'),
      button:  TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:12) ,
      bodyText1: TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:14) ,
      bodyText2: TextStyle(color: MyColors().bLue3,fontWeight: FontWeight.normal,fontFamily:fontFamily,fontSize:14) ,
    ),
    primaryTextTheme: TextTheme(
      button: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:15),
      headline5: TextStyle(
          fontSize:25,fontWeight: FontWeight.bold,color: MyColors().bLue3,fontFamily:fontFamily),
      headline6: const TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black,fontFamily:fontFamily),
      caption: const TextStyle(fontSize:14, fontWeight: FontWeight.normal, color: Colors.black, fontFamily:fontFamily),
      subtitle1: const TextStyle(fontSize:14, fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Logistics'),
      subtitle2: const TextStyle(fontSize:14, fontWeight: FontWeight.normal,color: Colors.black,fontFamily: 'Logistics'),
      bodyText1: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontFamily:fontFamily,fontSize:14) ,
      bodyText2: const TextStyle(color:Colors.black,fontWeight: FontWeight.normal,fontFamily:fontFamily,fontSize:14) ,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(
      primary: Colors.transparent,
      minimumSize: const Size(88, 36),
      textStyle: TextStyle(color: MyColors().bLue2,fontWeight: FontWeight.bold,fontFamily:fontFamily),
      padding: const EdgeInsets.symmetric(horizontal:5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color:   MyColors().bLue1,
              width: 3,
            );
          }
          return   BorderSide(
            color:   MyColors().bLue2,
            width: 3,
          ); // Defer to the widget's default.
        },
      ),
    )),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle()
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      buttonColor: Colors.transparent,
    ),

    textButtonTheme: TextButtonThemeData(style: ButtonStyle(
        overlayColor:  MaterialStateProperty.all<Color>(myBlue1),
        padding:  MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all<Color>(primary),
        textStyle:  MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white,)),
        shape:MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ))
    ),
    ),
    shadowColor:  myBlue1,
    primaryColor: primary,
    cardTheme: CardTheme(color: myBlue1,),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 1.0,
        backgroundColor: primary,
        foregroundColor: Colors.white.withOpacity(0.7)
    ),
    iconTheme: const IconThemeData(color: Colors.white,),
    colorScheme: ColorScheme.light(
      primary: primary,
      background: myBlue2,
    ),
  );

  static  BoxDecoration cardDecoration(BuildContext context,
      { Color ?color,  double ?borderRadius}) {
    return BoxDecoration(
      color: color ?? Theme.of(context).cardColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          spreadRadius: -2,
          blurRadius: 16,
          offset: const Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
    );
  }

}

