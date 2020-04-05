import 'package:flutter/material.dart';

// const Color(0xF065535),
//                 const Color(0xFF065535)

Map<int, Color> color = {
  50: Color(0x1F065535),
  100: Color(0x3F065535),
  200: Color(0x6F065535),
  300: Color(0x8F065535),
  400: Color(0xAF065535),
  500: Color(0xBF065535),
  600: Color(0xCF065535),
  700: Color(0xDF065535),
  800: Color(0xEF065535),
  900: Color(0xFF065535),
};

final theme = ThemeData(
  primarySwatch: MaterialColor(0xFF34755b, color),
  accentColor: Colors.greenAccent,
);
