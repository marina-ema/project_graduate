import 'package:flutter/material.dart';

class DarkThemeColors {
  static const Gradient cardGradient = LinearGradient(
    colors: [Colors.black, Colors.grey],
  );

  static const Color textColor = Colors.white;

  static Color surfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color cardColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }
}

ThemeData DarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color.fromARGB(255, 11, 170, 143),
  canvasColor: Colors.grey[900],
  cardColor: Colors.grey[850],
  appBarTheme: const AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 11, 170, 143),
    foregroundColor: Colors.white,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.teal,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white70),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 11, 170, 143)),
    trackColor:
        MaterialStateProperty.all(const Color.fromARGB(255, 3, 104, 81)),
  ),
);
