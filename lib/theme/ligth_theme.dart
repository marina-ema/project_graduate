import 'package:flutter/material.dart';

class LightThemeColors {
  static const Gradient cardGradient = LinearGradient(
    colors: [Colors.blue, Colors.green],
  );

  static const Color textColor = Colors.black;

  static Color surfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color cardColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }
}

ThemeData LightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 11, 170, 143),
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.grey[100],
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 11, 170, 143),
    foregroundColor: Colors.white,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.teal,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black87),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 11, 170, 143)),
    trackColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 3, 104, 81)),
  ),
);
