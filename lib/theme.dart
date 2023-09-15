import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xffB7935F);
  static Color blackColor = const Color(0xff242424);
  static Color whiteColor = const Color(0xffffffff);
  static Color darkPrimary = const Color(0xff141A2E);
  static Color yellowColor = const Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, color: whiteColor, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 25, color: whiteColor, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 25, color: blackColor, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          fontSize: 25, color: yellowColor, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
          fontSize: 25, color: blackColor, fontWeight: FontWeight.w400),
    ),
  );
}
