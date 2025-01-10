import 'package:flutter/material.dart';

class MyTheme {
  // color   light mode     dark mode

  static Color blackColor = Color(0xff242424);
  static Color primaryLightColor = Color(0xffB7935F);
  static ThemeData lightMode = ThemeData(
      canvasColor: primaryLightColor,
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor, showUnselectedLabels: true),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: blackColor)));
}
