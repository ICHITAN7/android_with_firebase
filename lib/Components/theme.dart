import 'package:android_with_firebase/Components/appbar.dart';
import 'package:android_with_firebase/Components/elevatedButton.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:flutter/material.dart';
class HThemeApp {
  HThemeApp._();
  static ThemeData lighTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: HTextTheme.lighTextTheme,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    useMaterial3: true,
    elevatedButtonTheme: HThemeElevatedButton.lightElevatedButton,
    appBarTheme: HAppBarTheme.lightAppBarTheme
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: HTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.red,
    useMaterial3: true,
    elevatedButtonTheme: HThemeElevatedButton.darkElevatedButton,
    appBarTheme: HAppBarTheme.darkAppBarTheme
  );
}