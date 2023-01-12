import 'dart:ui';
import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xffB7935F);
  static Color accentColor = const Color(0xff242424);
  static Color primaryDarkColor = const Color(0xff141A2E);
  static Color accentDarkColor = const Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: accentColor, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: accentColor),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 22, color: accentColor, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 20, color: accentColor, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            fontSize: 18, color: accentColor, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 18, color: primaryColor),
        labelMedium: TextStyle(fontSize: 18, color: accentColor),
        titleMedium: TextStyle(fontSize: 18, color: Colors.blue)),
    dividerTheme: DividerThemeData(color: primaryColor),
    iconTheme: IconThemeData(color: primaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    accentColor: accentDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: accentDarkColor, fontSize: 22, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: accentDarkColor, unselectedItemColor: Colors.white),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 22, color: accentDarkColor, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            fontSize: 18, color: accentDarkColor, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 18, color: accentDarkColor),
        labelMedium: TextStyle(fontSize: 18, color: primaryDarkColor),
        titleMedium: TextStyle(fontSize: 18, color: Colors.blue)),
    dividerTheme: DividerThemeData(color: accentDarkColor),
    iconTheme: IconThemeData(color: accentDarkColor),
  );
}
