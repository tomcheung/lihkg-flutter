import 'package:flutter/material.dart';

class LiHkgAppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.amber,
    backgroundColor: Color(0xFFECEDED),
    cardColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white
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
