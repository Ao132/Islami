import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xffB7935F);
  static Color blackColor = const Color(0xff242424);
  static Color whiteColor = const Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
