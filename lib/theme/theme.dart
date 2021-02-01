import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeData _darkTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  ThemeData _lightTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  getLightTheme() => _lightTheme;
  getDarkTheme() => _darkTheme;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
