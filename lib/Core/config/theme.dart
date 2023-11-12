import 'package:flutter/material.dart';

final appTheme = ThemeData(
    primaryColor: const Color(0XFF196cba), // Blue
    accentColor: const Color(0XFF4db3fb),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Color(0XFF4f5c63),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Color(0XFF196cba),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color(0XFF196cba),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));
