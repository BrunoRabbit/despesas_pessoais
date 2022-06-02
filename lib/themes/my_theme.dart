import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff303030),
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xfff6f6f6),
    primarySwatch: Colors.purple,
    colorScheme: const ColorScheme.light(),
  );
}
