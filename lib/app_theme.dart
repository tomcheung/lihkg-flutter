import 'package:flutter/material.dart';

class LiHkgAppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.amber,
    backgroundColor: Color(0xFFECEDED),
    cardColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black)
    ),
    textTheme: TextTheme(
      subtitle2: TextStyle(color: Colors.grey.shade400, fontSize: 11, fontWeight: FontWeight.w400),
    ),
    dividerColor: Colors.grey.shade200,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
        textStyle: TextStyle(fontSize: 16),
      ),
    ),
  );
}
