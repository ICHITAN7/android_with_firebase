import 'package:android_with_firebase/Components/colors.dart';
import 'package:flutter/material.dart';
class HAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: primaryColor),
    color: Colors.red
  );
}