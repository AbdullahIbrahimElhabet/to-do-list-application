import 'package:flutter/material.dart';

class MyTheme {
  static const primaryColor = Color.fromRGBO(93, 156, 236, 1.0);
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1.0);
  static const greenColor = Color.fromRGBO(97, 231, 87, 1.0);
  static const redColor = Color.fromRGBO(236, 75, 75, 1.0);
  static const blackColor = Color.fromRGBO(56, 56, 56, 1.0);
  static const ofWhite = Color.fromRGBO(223, 236, 219, 1.0);
  static const blueBlack = Color.fromRGBO(6, 14, 30, 1.0);
  static ThemeData ligthTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: ofWhite,
    colorScheme: ColorScheme(
      background: primaryColor,
      brightness: Brightness.light,
      error: Colors.red,
      onBackground: whiteColor,
      onError: Colors.red,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
      onSurface: blackColor,
      primary: primaryColor,
      secondary: primaryColor,
      surface: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: blueBlack,
    colorScheme: ColorScheme(
      background: primaryColor,
      brightness: Brightness.dark,
      error: Colors.red,
      onBackground: blackColor,
      onError: Colors.red,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
      onSurface: whiteColor,
      primary: primaryColor,
      secondary: primaryColor,
      surface: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: greenColor,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: blueBlack),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
